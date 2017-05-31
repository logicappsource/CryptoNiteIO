//
//  ExchangeRate.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 31/05/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//



import Foundation
import Serpent

//Later implement % of volume + diSplay cheapeast and lowest exchange data


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
