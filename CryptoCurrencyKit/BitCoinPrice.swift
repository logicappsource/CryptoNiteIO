//
//  BitcoinPrice.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 31/05/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

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
