//
//  EthereumPresenter.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 31/05/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation

class EthereumPresenter {
    let interactor: EthereumInteractorInput
    let coordinator: EthereumCoordinatorInput
    weak var output: EthereumPresenterOutput?

    init(interactor: EthereumInteractorInput, coordinator: EthereumCoordinatorInput) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
}

// MARK: - User Events -

extension EthereumPresenter: EthereumPresenterInput {
    func viewCreated() {

    }
}

// MARK: - Presentation Logic -

// INTERACTOR -> PRESENTER (indirect)
extension EthereumPresenter: EthereumInteractorOutput {

}
