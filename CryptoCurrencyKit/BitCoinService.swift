/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Foundation

typealias StatsCompletionBlock = (_ stats: BitCoinStats?, _ error: NSError?) -> ()
typealias MarketPriceCompletionBlock = (_ prices: [BitCoinPrice]?, _ error: NSError?) -> ()

class BitCoinService {

  let statsCacheKey = "BitCoinServiceStatsCache"
  let statsCachedDateKey = "BitCoinServiceStatsCachedDate"

  let priceHistoryCacheKey = "BitCoinServicePriceHistoryCache"
  let priceHistoryCachedDateKey = "BitCoinServicePriceHistoryCachedDate"

  let session: URLSession

  class var sharedInstance: BitCoinService {
    struct Singleton {
      static let instance = BitCoinService()
    }
    return Singleton.instance
  }

  init() {
    let configuration = URLSessionConfiguration.default
    session = URLSession(configuration: configuration)
  }

  func getStats(_ completion: @escaping StatsCompletionBlock) {
    if let cachedStats: BitCoinStats = getCachedStats() {
      completion(cachedStats, nil)
      return
    }

    let statsUrl = URL(string: "https://blockchain.info/stats?format=json")
    let request = URLRequest(url: statsUrl!)
    let task = session.dataTask(with: request) {[unowned self] data, response, dataError in
      if dataError == nil {
        do {
          let statsDictionary = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
          let stats: BitCoinStats = BitCoinStats(fromJSON: JSON(dictionary: statsDictionary))
          self.cacheStats(stats)
          completion(stats, nil)
        } catch {
          completion(nil, error as NSError)
        }
      } else {
        completion(nil, dataError as NSError?)
      }
    }

    task.resume()
  }

  func getMarketPriceInUSDForPast30Days(_ completion: @escaping MarketPriceCompletionBlock) {
    if let cachedPrices: [BitCoinPrice] = getCachedPriceHistory() {
      completion(cachedPrices, nil)
      return
    }

    let pricesUrl = URL(string: "https://blockchain.info/charts/market-price?timespan=30days&format=json")
    let request = URLRequest(url: pricesUrl!);
    let task = session.dataTask(with: request) {[unowned self] data, response, dataError in
      if dataError == nil {
        do {
          let pricesDictionary = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSDictionary
          let priceValues = pricesDictionary["values"] as! Array<NSDictionary>
          var prices = [BitCoinPrice]()
          for priceDictionary in priceValues {
            let price = BitCoinPrice(fromJSON: JSON(dictionary: priceDictionary))
            prices.append(price)
          }
          self.cachePriceHistory(prices)
          completion(prices, nil)

        } catch {
          completion(nil, error as NSError)
        }

      } else {
        completion(nil, dataError as NSError?)
      }
    }

    task.resume()
  }

  func yesterdaysPriceUsingPriceHistory(_ priceHistory: Array<BitCoinPrice>) -> (BitCoinPrice?) {
    var yesterdaysPrice: BitCoinPrice?
    let calendar = Calendar(identifier: .gregorian)

    for price in priceHistory.reversed() {
      if calendar.isDateInYesterday(price.time) {
        yesterdaysPrice = price
        break;
      }
    }

    return yesterdaysPrice
  }


  func loadCachedDataForKey(_ key: String, cachedDateKey: String) -> AnyObject? {
    var cachedValue: AnyObject?

    if let cachedDate = UserDefaults.standard.value(forKey: cachedDateKey) as? Date {
      let timeInterval = Date().timeIntervalSince(cachedDate)
      if (timeInterval < 60*5) {
        let cachedData = UserDefaults.standard.value(forKey: key) as? Data
        if cachedData != nil {
          cachedValue = NSKeyedUnarchiver.unarchiveObject(with: cachedData!) as AnyObject?
        }
      }
    }


    return cachedValue
  }

  func getCachedStats() -> BitCoinStats? {
    let stats = loadCachedDataForKey(statsCacheKey, cachedDateKey: statsCachedDateKey) as? BitCoinStats
    return stats
  }

  func getCachedPriceHistory() -> [BitCoinPrice]? {
    let prices = loadCachedDataForKey(priceHistoryCacheKey, cachedDateKey: priceHistoryCachedDateKey) as? [BitCoinPrice]
    return prices
  }

  func cacheStats(_ stats: BitCoinStats) {
    print(stats)
    let statsData = NSKeyedArchiver.archivedData(withRootObject: stats)

    UserDefaults.standard.setValue(statsData, forKey: statsCacheKey)
    UserDefaults.standard.setValue(Date(), forKey: statsCachedDateKey)
  }

  func cachePriceHistory(_ history: [BitCoinPrice]) {
    let priceData = NSKeyedArchiver.archivedData(withRootObject: history)

    UserDefaults.standard.setValue(priceData, forKey: priceHistoryCacheKey)
    UserDefaults.standard.setValue(Date(), forKey: priceHistoryCachedDateKey)
  }
}

