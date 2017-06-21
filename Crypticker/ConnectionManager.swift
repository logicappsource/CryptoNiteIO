//
//  ConnectionManager.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 21/06/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import Alamofire

final class ConnectionManager {
    
    let baseURL =  URL(string: "https://spreadsheets.google.com/feeds/list/1NoSXTQFtqZyL0o6n5QIVnDVDCG4THRZPhVAao9gG8jo/od6/public/basic?alt=json")!
    
    
    let manager: SessionManager
    
    var defaultHeaders: [String: String] {
        return [:]
    }
    
    init() {
        let sessionConfiguration = SessionManager.default.session.configuration
        sessionConfiguration.timeoutIntervalForRequest = 20.0
        
        self.manager = SessionManager(configuration: sessionConfiguration)
    }
    
    
    
}

extension ConnectionManager: RepositoryAPI {
    func getCurrencies(completion: @escaping ((DataResponse<ApiResponseCurrency>) -> Void)) {
        manager.request(baseURL).responseSerializable(completion)
    }
}
