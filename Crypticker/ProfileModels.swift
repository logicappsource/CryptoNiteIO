//
//  ProfileModels.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 21/06/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation

enum Profile {
    enum Request { }
    enum Response { }
    enum DisplayData { }
}

extension Profile.Request {
    struct Currency {
    }
}

extension Profile.Response {
    struct Currency {
        var btc:String?
        var eth:String?
        var ethValue:String?
        var btcValue:String?
        var xrp:String?
        var xrpValue:String?
        var ltc:String?
        var ltcValue:String?
        
        var etc:String?
        var etcValue:String?
        
        var xem:String?
        var xemValue:String?
        var dash:String?
        var dashValue:String?
        /*
        var strat:String?
        var stratValue:String?
        var xmr:String?
        var xmrValue:String?
        var zec:String?
        var zecValue:String?
        var gnt:String?
        var gntValue:String?
        var sc:String?
        var scValue:String?
        var xlm:String?
        var xlmValue:String?
 */
    }
}

extension Profile.DisplayData {
    struct Currency {
        var btc:String
        var eth:String
        var ethValue:String
        var btcValue:String
        var xrp:String
        var xrpValue:String
        
        var ltc:String
        var ltcValue:String
        
        var etc:String
        var etcValue:String
        
        var xem:String
        var xemValue:String
        var dash:String
        var dashValue:String
             /*
        var strat:String
        var stratValue:String
        var xmr:String
        var xmrValue:String
        var zec:String
        var zecValue:String
        var gnt:String
        var gntValue:String
        var sc:String
        var scValue:String
        var xlm:String
        var xlmValue:String
 */
    }
    struct Error {
        var message:String        
    }
    
}
