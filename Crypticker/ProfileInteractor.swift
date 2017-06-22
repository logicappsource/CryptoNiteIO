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
                guard let cellSTRAT = currencies.feed?.entry?[7] else {return} //display 8. STRATIS Cell
                guard let cellXMR = currencies.feed?.entry?[8] else {return} //display 9. XMR Cell
                guard let cellZEC = currencies.feed?.entry?[9] else {return} //display 10. ZEC Cell
                guard let cellGNT = currencies.feed?.entry?[10] else {return} //display 11.  GNT Cell
                guard let cellSC = currencies.feed?.entry?[11] else {return} //display 12.  SC Cell
                guard let cellXLM = currencies.feed?.entry?[12] else {return} // display 13 XLM cell
                
                
                let currency = Profile.Response.Currency(btc: cell.title?.value, eth: cellETH.title?.value ,ethValue: cellETH.content?.value, btcValue: cell.content?.value, xrp: cellXRP.title?.value, xrpValue: cellXRP.content?.value, ltc: cellLTC.title?.value, ltcValue: cellLTC.content?.value, etc: cellETC.title?.value, etcValue: cellETC.content?.value,  xem: cellXEM.title?.value, xemValue: cellXEM.content?.value, dash: cellDASH.title?.value, dashValue: cellDASH.content?.value, strat: cellSTRAT.title?.value, stratValue: cellSTRAT.content?.value,xmr: cellXMR.title?.value, xmrValue: cellXMR.content?.value, zec: cellZEC.title?.value, zecValue: cellZEC.content?.value, gnt: cellGNT.title?.value, gntValue: cellGNT.content?.value, sc: cellSC.title?.value, scValue: cellSC.content?.value, xlm: cellXLM.title?.value, xlmValue: cellXLM.content?.value)
                
                self.output?.present(currency)
                
            case .failure(_):
                print("Some error handled")
            }
        }
    }
}



