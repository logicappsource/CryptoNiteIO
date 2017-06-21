//
//  ProfileInteractor.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 21/06/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation

class ProfileInteractor {
    weak var output: ProfileInteractorOutput?
    var reposotory: RepositoryAPI
    
    init(repository: RepositoryAPI) {
        self.reposotory = repository
    }
}

// MARK: - Business Logic -

// PRESENTER -> INTERACTOR
extension ProfileInteractor: ProfileInteractorInput {
    func perform(_ request: Profile.Request.Currency) {
        self.reposotory.getCurrencies { (response) in
            switch response.result {
            case .success(let currencies):
                
                guard let cell = currencies.feed?.entry?[0] else {return} //display BTC - Type
               // guard let cellValue = currencies.feed?.entry?[1] else {return}
                
               let currency = Profile.Response.Currency(btc: cell.title?.value, eth: cell.content?.value, btcValue: cell.content?.value, tsst: cell.content?.value)
                self.output?.present(currency)
            case .failure(_):
                print("Some error handled")
            }
        }
    }
}


/*  guard let cellXRP = currencies.feed?.entry?[1] else {return}
 guard let cellTSST = currencies.feed?.entry?[2] else {return}
 guard let cellETH = currencies.feed?.entry?[3] else {return}
 
 let currency = Profile.Response.Currency(btc: cellBTC.title?.value , eth: cellETH.content?.value, xrp: cellXRP.content?.value, tsst: cellTSST.content?.value)*/
