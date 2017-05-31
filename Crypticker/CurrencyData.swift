//
//  CurrencyData.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 31/05/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import Serpent

struct CurrencyData {
    
    var eth: [String: [String: AnyObject]] = [:]
    var dash: [String: [String: AnyObject]] = [:]
    var xrp: [String: [String: AnyObject]] = [:]
    
    var price = ""
    var high24Hour = ""
    var low24Hour = ""
    var changePct24Hour = ""
    var change24Hour = ""
    var open24Hour = ""
    var supply = ""
    var lastVolume = ""
    var volume24Hour = ""
    var volume24HourTo = ""
    
}


extension CurrencyData: Serializable {
    init(dictionary: NSDictionary?) {
        eth             <== (self, dictionary, "eth")
        dash            <== (self, dictionary, "dash")
        xrp             <== (self, dictionary, "xrp")
        price           <== (self, dictionary, "price")
        high24Hour      <== (self, dictionary, "high24Hour")
        low24Hour       <== (self, dictionary, "low24Hour")
        changePct24Hour <== (self, dictionary, "changePct24Hour")
        change24Hour    <== (self, dictionary, "change24Hour")
        open24Hour      <== (self, dictionary, "open24Hour")
        supply          <== (self, dictionary, "supply")
        lastVolume      <== (self, dictionary, "lastVolume")
        volume24Hour    <== (self, dictionary, "volume24Hour")
        volume24HourTo  <== (self, dictionary, "volume24HourTo")
    }
    
    func encodableRepresentation() -> NSCoding {
        let dict = NSMutableDictionary()
        (dict, "eth")             <== eth
        (dict, "dash")            <== dash
        (dict, "xrp")             <== xrp
        (dict, "price")           <== price
        (dict, "high24Hour")      <== high24Hour
        (dict, "low24Hour")       <== low24Hour
        (dict, "changePct24Hour") <== changePct24Hour
        (dict, "change24Hour")    <== change24Hour
        (dict, "open24Hour")      <== open24Hour
        (dict, "supply")          <== supply
        (dict, "lastVolume")      <== lastVolume
        (dict, "volume24Hour")    <== volume24Hour
        (dict, "volume24HourTo")  <== volume24HourTo
        return dict
    }
}
