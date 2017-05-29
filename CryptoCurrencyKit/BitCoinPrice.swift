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

open class BitCoinPrice : NSObject, NSCoding {
  open let value :NSNumber
  open let time :Date
  override open var description: String {
    return "Price: $\(value) at \(time)"
  }

  public init(fromJSON json: JSON) {
    value = json["y"].number!

    let timeInterval :TimeInterval = json["x"].double!
    let timezoneBump = Double(-TimeZone.current.secondsFromGMT()) //since times are usually recorded at midnight UTC, those of in North America will never see a true "yesterday" price, making this a bad example, so this bumps the yesterday at GMT to a yesterday in the current time zone
    time = Date(timeIntervalSince1970: timeInterval + timezoneBump)
  }

  public required init(coder aDecoder: NSCoder)  {
    value = aDecoder.decodeObject(forKey: "value") as! NSNumber
    time = aDecoder.decodeObject(forKey: "time") as! Date
  }

  open func encode(with aCoder: NSCoder) {
    aCoder.encode(value, forKey: "value")
    aCoder.encode(time, forKey: "time")
  }

}
