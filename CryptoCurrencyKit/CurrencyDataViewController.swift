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

import UIKit

open class CurrencyDataViewController: UIViewController, JBLineChartViewDataSource, JBLineChartViewDelegate {
  
  @IBOutlet open var priceLabel: UILabel!
  @IBOutlet open var priceChangeLabel: UILabel!
  @IBOutlet open var priceOnDayLabel: UILabel!
  @IBOutlet open var dayLabel: UILabel!
  @IBOutlet open var lineChartView: JBLineChartView!
  
  open let dollarNumberFormatter: NumberFormatter, prefixedDollarNumberFormatter: NumberFormatter
  
  open var prices: [BitCoinPrice]?
  open var priceDifference: NSNumber? {
    get {
      var difference: NSNumber?
      if (stats != nil && prices != nil) {
        if let yesterdaysPrice = BitCoinService.sharedInstance.yesterdaysPriceUsingPriceHistory(prices!) {
          difference = NSNumber(value: stats!.marketPriceUSD.floatValue - yesterdaysPrice.value.floatValue)
        }
      }
      
      return difference
    }
  }
  
  open var stats: BitCoinStats?
  
  public required init?(coder aDecoder: NSCoder) {
    dollarNumberFormatter = NumberFormatter()
    dollarNumberFormatter.numberStyle = .currency
    dollarNumberFormatter.currencyCode = "USD"

    prefixedDollarNumberFormatter = NumberFormatter()
    prefixedDollarNumberFormatter.numberStyle = .currency
    prefixedDollarNumberFormatter.positivePrefix = "+"
    prefixedDollarNumberFormatter.negativePrefix = "-"
    
    super.init(coder: aDecoder)
  }

  open func fetchPrices(_ completion: @escaping (_ error: NSError?) -> ()) {
    BitCoinService.sharedInstance.getStats { stats, error in
      BitCoinService.sharedInstance.getMarketPriceInUSDForPast30Days { prices, error in
        DispatchQueue.main.async {
          self.prices = prices
          self.stats = stats
          completion(error)
        }
      }
    }
  }
  
  open func updatePriceLabel() {
    self.priceLabel.text =  priceLabelString()
  }
  
  open func updatePriceChangeLabel() {
    let stringAndColor = priceChangeLabelStringAndColor()
    priceChangeLabel.textColor = stringAndColor.color
    priceChangeLabel.text = stringAndColor.string
  }

  open func updatePriceOnDayLabel(_ price: BitCoinPrice) {
    priceOnDayLabel?.text = dollarNumberFormatter.string(from: price.value)
  }

  open func updatePriceHistoryLineChart() {
    if let prices = prices {
      let pricesNSArray = prices as NSArray
      let maxPrice = pricesNSArray.value(forKeyPath: "@max.value") as! NSNumber
      lineChartView.maximumValue = CGFloat(maxPrice.floatValue * 1.02)
      DispatchQueue.main.async { [weak self] in
        self?.lineChartView.reloadData()
      }

    }
  }
  
  open func priceLabelString() -> (String) {
    return dollarNumberFormatter.string(from: stats?.marketPriceUSD ?? 0)!
  }
  
  open func priceChangeLabelStringAndColor() -> (string: String, color: UIColor) {
    var string: String?
    var color: UIColor?
    
    if let priceDifference = priceDifference {
      if (priceDifference.floatValue > 0) {
        color = UIColor.green
      } else {
        color = UIColor.red
      }
      
      string = prefixedDollarNumberFormatter.string(from: priceDifference)
    }
    
    return (string ?? "", color ?? UIColor.blue)
  }

  // MARK: - JBLineChartViewDataSource & JBLineChartViewDelegate
  
  open func numberOfLines(in lineChartView: JBLineChartView!) -> UInt {
    return 1
  }
  
  open func lineChartView(_ lineChartView: JBLineChartView!, numberOfVerticalValuesAtLineIndex lineIndex: UInt) -> UInt {
    var numberOfValues = 0
    if let prices = prices {
      numberOfValues = prices.count
    }
    
    return UInt(numberOfValues)
  }
  
  open func lineChartView(_ lineChartView: JBLineChartView!, verticalValueForHorizontalIndex horizontalIndex: UInt, atLineIndex lineIndex: UInt) -> CGFloat {
    var value: CGFloat = 0.0
    if let prices = prices {
      let price = prices[Int(horizontalIndex)]
      value = CGFloat(price.value.floatValue)
    }
    
    return value
  }
  
  open func lineChartView(_ lineChartView: JBLineChartView!, widthForLineAtLineIndex lineIndex: UInt) -> CGFloat {
    return 3.0
  }
  
  open func lineChartView(_ lineChartView: JBLineChartView!, colorForLineAtLineIndex lineIndex: UInt) -> UIColor! {
    return UIColor.white
  }
  
  open func verticalSelectionWidth(for lineChartView: JBLineChartView!) -> CGFloat {
    return 1.0;
  }

}
