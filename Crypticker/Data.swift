//
//  Title.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 21/06/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import Serpent

struct Data {
    var type =  ""
    var value = "" //<-$t
    
}


extension Data: Serializable {
    init(dictionary: NSDictionary?) {
        type  <== (self, dictionary, "type")
        value <== (self, dictionary, "$t")
    }
    
    func encodableRepresentation() -> NSCoding {
        let dict = NSMutableDictionary()
        (dict, "type") <== type
        (dict, "$t")   <== value
        return dict
    }
}
