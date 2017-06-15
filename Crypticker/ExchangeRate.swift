//
//  ExchangeRate.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 31/05/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//



import Foundation
import Serpent
import Foundation

struct ExchangeRate {
    
    var id = ""
    var name = ""
    var symbol = ""
    var rank = ""
    var price_usd = ""
    var last_24h_volume_usd = ""
    var market_cap_usd = ""
    var availible_supply = ""
    var percent_change_1h = ""
    var percent_change_24h = ""
    var percent_change_7d = ""
    var last_updated = ""
    var ethereum :  [String: AnyObject] = [:]
    
}






extension ExchangeRate: Serializable {
    init(dictionary: NSDictionary?) {
        id                  <== (self, dictionary, "id")
        name                <== (self, dictionary, "name")
        symbol              <== (self, dictionary, "symbol")
        rank                <== (self, dictionary, "rank")
        price_usd           <== (self, dictionary, "price_usd")
        last_24h_volume_usd <== (self, dictionary, "last_24h_volume_usd")
        market_cap_usd      <== (self, dictionary, "market_cap_usd")
        availible_supply    <== (self, dictionary, "availible_supply")
        percent_change_1h   <== (self, dictionary, "percent_change_1h")
        percent_change_24h  <== (self, dictionary, "percent_change_24h")
        percent_change_7d   <== (self, dictionary, "percent_change_7d")
        last_updated        <== (self, dictionary, "last_updated")
        ethereum            <== (self, dictionary, "ethereum")
    }
    
    func encodableRepresentation() -> NSCoding {
        let dict = NSMutableDictionary()
        (dict, "id")                  <== id
        (dict, "name")                <== name
        (dict, "symbol")              <== symbol
        (dict, "rank")                <== rank
        (dict, "price_usd")           <== price_usd
        (dict, "last_24h_volume_usd") <== last_24h_volume_usd
        (dict, "market_cap_usd")      <== market_cap_usd
        (dict, "availible_supply")    <== availible_supply
        (dict, "percent_change_1h")   <== percent_change_1h
        (dict, "percent_change_24h")  <== percent_change_24h
        (dict, "percent_change_7d")   <== percent_change_7d
        (dict, "last_updated")        <== last_updated
        (dict, "ethereum")            <== ethereum
        return dict
    }
}



//Later implement % of volume + diSplay cheapeast and lowest exchange data



/*

struct ExchangeRate {

    var RAW: [String : [String: AnyObject]] = [:]
    
}


extension ExchangeRate: Serializable {
    init(dictionary: NSDictionary?) {
        RAW <== (self, dictionary, "RAW")
    }
    
    func encodableRepresentation() -> NSCoding {
        let dict = NSMutableDictionary()
        (dict, "RAW") <== RAW
        return dict
    }
}


extension ExchangeRate {
    var currencies: [CurrencyData]  {
        return RAW.values.map({ (value) -> CurrencyData in
            return CurrencyData(dictionary: value as NSDictionary)
    })
}





}
*/ 
