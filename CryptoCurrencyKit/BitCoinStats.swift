

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
