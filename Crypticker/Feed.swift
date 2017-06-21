//
//  Feed.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 21/06/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import Serpent

struct Feed {
    var entry: [Cell]?
    
}


extension Feed: Serializable {
    init(dictionary: NSDictionary?) {
        entry <== (self, dictionary, "entry")
    }
    
    func encodableRepresentation() -> NSCoding {
        let dict = NSMutableDictionary()
        (dict, "entry") <== entry
        return dict
    }
}
