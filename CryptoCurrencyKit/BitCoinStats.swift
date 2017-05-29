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

open class BitCoinStats : NSObject, NSCoding {
    let marketPriceUSD: NSNumber
    let time: Date
  
    override open var description: String {
        return "Price: \(marketPriceUSD) right now (\(time))"
    }
    
    public init(fromJSON json: JSON) {
        marketPriceUSD = json["market_price_usd"].number!
        
        let timeInterval :TimeInterval = json["timestamp"].double! / 1000
        time = Date(timeIntervalSince1970: timeInterval)
        
    }
    
    public required init(coder aDecoder: NSCoder) {
        marketPriceUSD = aDecoder.decodeObject(forKey: "marketPriceUSD") as! NSNumber
        time = aDecoder.decodeObject(forKey: "time") as! Date
    }
    
    open func encode(with aCoder: NSCoder)  {
        aCoder.encode(marketPriceUSD, forKey: "marketPriceUSD")
        aCoder.encode(time, forKey: "time")
    }
}
