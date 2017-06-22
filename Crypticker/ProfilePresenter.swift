//
//  ProfilePresenter.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 21/06/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation

class ProfilePresenter {
    let interactor: ProfileInteractorInput
    let coordinator: ProfileCoordinatorInput
    weak var output: ProfilePresenterOutput?

    init(interactor: ProfileInteractorInput, coordinator: ProfileCoordinatorInput) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
}

// MARK: - User Events -

extension ProfilePresenter: ProfilePresenterInput {
    func viewCreated() {
        
    }
    func getData(){
        let request = Profile.Request.Currency()
        interactor.perform(request)
    }
}

// MARK: - Presentation Logic -

// INTERACTOR -> PRESENTER (indirect)
extension ProfilePresenter: ProfileInteractorOutput {
    
    func present(_ response: Profile.Response.Currency) {
        
        guard let btc = response.btc, let btcValue = response.btcValue, let xrp = response.xrp, let xrpValue = response.xrpValue , let ETH = response.eth , let ethValue = response.ethValue, let ltc = response.ltc, let ltcValue = response.ltcValue,
            let etc = response.etc, let etcValue = response.etcValue,  let xem = response.xem, let xemValue = response.xemValue, let dash = response.dash, let dashValue = response.dashValue, let strat = response.strat, let stratValue = response.stratValue, let xmr = response.xmr, let xmrValue = response.xmrValue, let zec = response.zec, let zecValue = response.zecValue, let gnt = response.gnt, let gntValue = response.gntValue, let sc = response.sc, let scValue = response.scValue, let xlm = response.xlm, let xlmValue = response.xlmValue  else {
            output?.display(Profile.DisplayData.Error(message: "Something went wrong!"))
            return
        }
        
        
        let currencyDD = Profile.DisplayData.Currency(btc: btc, eth: ETH, ethValue: ethValue , btcValue: btcValue, xrp: xrp, xrpValue: xrpValue, ltc: ltc , ltcValue: ltcValue, etc: etc, etcValue: etcValue, xem: xem, xemValue: xemValue, dash: dash, dashValue: dashValue, strat: strat, stratValue: stratValue, xmr: xmr, xmrValue: xmrValue, zec: zec, zecValue: zecValue, gnt: gnt , gntValue: gntValue, sc: sc, scValue: scValue, xlm: xlm , xlmValue: xlmValue )
        output?.display(currencyDD)
    }
}
