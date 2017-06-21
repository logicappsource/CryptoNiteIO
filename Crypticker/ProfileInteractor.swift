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
                
                guard let cell = currencies.feed?.entry?[0] else {return} //display 1. BTC Cell
                guard let cellXRP = currencies.feed?.entry?[1] else {return} //display 2. XRP Cell
                guard let cellETH = currencies.feed?.entry?[2] else {return} // display 3. ETH cell
                guard let cellLTC = currencies.feed?.entry?[3] else {return} // display 4. LTC cell
                guard let cellETC = currencies.feed?.entry?[4] else {return} // display 5. ETC cell
                guard let cellXEM = currencies.feed?.entry?[5] else {return} // display 6. XEM cell
                guard let cellDASH = currencies.feed?.entry?[6] else {return} // display 7. DASH cell
                
                let currency = Profile.Response.Currency(btc: cell.title?.value, eth: cellETH.title?.value ,ethValue: cellETH.content?.value, btcValue: cell.content?.value, xrp: cellXRP.title?.value, xrpValue: cellXRP.content?.value, ltc: cellLTC.title?.value, ltcValue: cellLTC.content?.value, etc: cellETC.title?.value, etcValue: cellETC.content?.value,  xem: cellXEM.title?.value, xemValue: cellXEM.content?.value, dash: cellDASH.title?.value, dashValue: cellDASH.content?.value )
                self.output?.present(currency)
            case .failure(_):
                print("Some error handled")
            }
        }
    }
}



