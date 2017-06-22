//
//  cell.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 21/06/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import Serpent

struct Cell {
    var title: Data?
    var content: Data?
}


extension Cell: Serializable {
    init(dictionary: NSDictionary?) {
        title   <== (self, dictionary, "title")
        content <== (self, dictionary, "content")
    }
    
    func encodableRepresentation() -> NSCoding {
        let dict = NSMutableDictionary()
        (dict, "title")   <== title
        (dict, "content") <== content
        return dict
    }
}
