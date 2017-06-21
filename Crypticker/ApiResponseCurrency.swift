//
//  ApiResponseCurrency.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 21/06/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import Serpent

struct ApiResponseCurrency {
    
    var feed: Feed?
}


extension ApiResponseCurrency: Serializable {
    init(dictionary: NSDictionary?) {
        feed <== (self, dictionary, "feed")
    }
    
    func encodableRepresentation() -> NSCoding {
        let dict = NSMutableDictionary()
        (dict, "feed") <== feed
        return dict
    }
}
