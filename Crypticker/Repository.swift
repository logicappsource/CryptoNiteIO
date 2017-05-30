//
//  Repository.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 30/05/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import Alamofire

protocol CurrencyRepository: class {
    func listAllCryptoCurrencies(completion: @escaping (DataResponse<[CryptoCurrencies]>) -> Void)
    
}
