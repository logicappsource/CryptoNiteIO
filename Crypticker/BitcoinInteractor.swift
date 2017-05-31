//
//  BitcoinInteractor.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 29/05/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import Alamofire

class BitcoinInteractor {
    weak var output: BitcoinInteractorOutput?
}

// MARK: - Business Logic -

// PRESENTER -> INTERACTOR
extension BitcoinInteractor: BitcoinInteractorInput {
}



func requestCryptoCurrencies(){
    makeCryptoCurrenciesRequest{ (response) in
        switch response.result {
        case .success(let CryptoCurrency):
            print("Result of respond: \(CryptoCurrency)")
            
            for currency in CryptoCurrency.currencies {
                print(" Currecny : \(CryptoCurrency.bitcoin)")
                print("Currency: \(CryptoCurrency.ethereum) ")
                
            }
            
        case .failure(let error):
            print("Request failed: \(error.localizedDescription)")
        
         }
    }
}




    //GET  - Currencies Endpoint
func makeCryptoCurrenciesRequest(completion: @escaping (DataResponse<CryptoCurrencies>) -> Void) {
    print("Requesting currencies API Call ")
    request(baseURL_Currency).responseSerializable(completion)
}

