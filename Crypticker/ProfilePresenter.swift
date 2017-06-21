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
        let etc = response.etc, let etcValue = response.etcValue,  let xem = response.xem, let xemValue = response.xemValue, let dash = response.dash, let dashValue = response.dashValue   else {
            output?.display(Profile.DisplayData.Error(message: "Something went wrong!"))
            return
        }
        let currencyDD = Profile.DisplayData.Currency(btc: btc, eth: ETH, ethValue: ethValue , btcValue: btcValue, xrp: xrp, xrpValue: xrpValue, ltc: ltc , ltcValue: ltcValue, etc: etc, etcValue: etcValue, xem: xem, xemValue: xemValue, dash: dash, dashValue: dashValue)
        output?.display(currencyDD)
    }
}
