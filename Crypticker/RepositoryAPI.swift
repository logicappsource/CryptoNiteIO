//
//  RepositoryAPI.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 21/06/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import Alamofire


protocol RepositoryAPI {
    func getCurrencies( completion: @escaping ((DataResponse<ApiResponseCurrency>) -> Void))
}
