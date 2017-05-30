//
//  CryptoCurrencies.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 30/05/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import Serpent

struct CryptoCurrencies {
    var bitcoin = ""
    var ethereum = ""
    var ripple = ""
    var nem = ""
    var ethclassic = ""
    var litcoine = ""
    var dash = ""
    var monero = ""
    var bytecoin = ""
    var stratis = ""
    var golem = ""
    var stellarlumiens = ""
    var zcash = ""
    var dogecoin = ""
    var gnosis = ""
    var wawes = ""
    var augur = ""
    var steem = ""
    var siacoin = ""
    var gamecredits = ""
    var bitshares = ""
    var maidsafecoin = ""
    var digibyte = ""
    var lisk = ""
    var factom = ""
    var iconomi = ""
    var pivx = ""
    var Data: [String: [String: AnyObject]] = [:]
}



extension CryptoCurrencies: Serializable {
    init(dictionary: NSDictionary?) {
        bitcoin        <== (self, dictionary, "bitcoin")
        ethereum       <== (self, dictionary, "ethereum")
        ripple         <== (self, dictionary, "ripple")
        nem            <== (self, dictionary, "nem")
        ethclassic     <== (self, dictionary, "ethclassic")
        litcoine       <== (self, dictionary, "litcoine")
        dash           <== (self, dictionary, "dash")
        monero         <== (self, dictionary, "monero")
        bytecoin       <== (self, dictionary, "bytecoin")
        stratis        <== (self, dictionary, "stratis")
        golem          <== (self, dictionary, "golem")
        stellarlumiens <== (self, dictionary, "stellarlumiens")
        zcash          <== (self, dictionary, "zcash")
        dogecoin       <== (self, dictionary, "dogecoin")
        gnosis         <== (self, dictionary, "gnosis")
        wawes          <== (self, dictionary, "wawes")
        augur          <== (self, dictionary, "augur")
        steem          <== (self, dictionary, "steem")
        siacoin        <== (self, dictionary, "siacoin")
        gamecredits    <== (self, dictionary, "gamecredits")
        bitshares      <== (self, dictionary, "bitshares")
        maidsafecoin   <== (self, dictionary, "maidsafecoin")
        digibyte       <== (self, dictionary, "digibyte")
        lisk           <== (self, dictionary, "lisk")
        factom         <== (self, dictionary, "factom")
        iconomi        <== (self, dictionary, "iconomi")
        pivx           <== (self, dictionary, "pivx")
        Data           <== (self, dictionary, "Data")
    }
    
    func encodableRepresentation() -> NSCoding {
        let dict = NSMutableDictionary()
        (dict, "bitcoin")        <== bitcoin
        (dict, "ethereum")       <== ethereum
        (dict, "ripple")         <== ripple
        (dict, "nem")            <== nem
        (dict, "ethclassic")     <== ethclassic
        (dict, "litcoine")       <== litcoine
        (dict, "dash")           <== dash
        (dict, "monero")         <== monero
        (dict, "bytecoin")       <== bytecoin
        (dict, "stratis")        <== stratis
        (dict, "golem")          <== golem
        (dict, "stellarlumiens") <== stellarlumiens
        (dict, "zcash")          <== zcash
        (dict, "dogecoin")       <== dogecoin
        (dict, "gnosis")         <== gnosis
        (dict, "wawes")          <== wawes
        (dict, "augur")          <== augur
        (dict, "steem")          <== steem
        (dict, "siacoin")        <== siacoin
        (dict, "gamecredits")    <== gamecredits
        (dict, "bitshares")      <== bitshares
        (dict, "maidsafecoin")   <== maidsafecoin
        (dict, "digibyte")       <== digibyte
        (dict, "lisk")           <== lisk
        (dict, "factom")         <== factom
        (dict, "iconomi")        <== iconomi
        (dict, "pivx")           <== pivx
        (dict, "Data")           <== Data
        return dict
    }
}





extension CryptoCurrencies {
    var currencies: [CryptoCurrencies] {
        return Data.values.map({ (value) -> CryptoCurrencies in
            return CryptoCurrencies(dictionary: value as NSDictionary)
        })
    }
}

