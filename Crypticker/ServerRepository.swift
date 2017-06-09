//
//  ServerRepository.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 30/05/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import Alamofire


 let baseURL_Currency = URL(string: "https://www.cryptocompare.com/api/data/coinlist/")! //Global
 let baseURL_Price = URL (string: "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH,DASH,XRP&tsyms=BTC,USD,EURO" ) //Add parameters in the url for more data request
 let baseURL_Ethereum = URL(string: "https://api.coinmarketcap.com/v1/ticker/?convert=EUR&limit=100") //Ethereum


class ServerRepository {
    
    let manager: SessionManager
    
    init() {
        let sessionConfiguration = SessionManager.default.session.configuration
        sessionConfiguration.timeoutIntervalForRequest = 20.0
        self.manager = SessionManager(configuration: sessionConfiguration)
    }
    

    
}



/*


extension ServerRepository: CurrencyRepository {
    func listAllCryptoCurrencies(completion: @escaping (DataResponse<[CryptoCurrencies]>) -> Void) {
        manager
            .request(baseURL_Currency).responseSerializable(completion, unwrapper: {dictionary, _ in
                    return dictionary["results"]
            })
    }

 
*/
 
    
    /*
extension ServerRepository: EthereumRepository {
        func listAllEthData(completion: @escaping(DataResponse<[EthereumCurrency]>) -> Void ) {
            manager
                .request(baseURL_Ethereum).responseSerializabl(completion, unwrapper: {dictionary, _ in
                return dictionary["results"]
        })
    }
    
    */
    
    
    
    

    

