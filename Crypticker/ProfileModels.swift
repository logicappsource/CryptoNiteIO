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
    }
}

extension Profile.DisplayData {
    struct Currency {
        var btc:String
        var eth:String
    }
    struct Error {
        var message:String        
    }
    
}
