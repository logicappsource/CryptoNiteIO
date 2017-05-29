//
//  BitcoinPresenter.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 29/05/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation

class BitcoinPresenter {
    let interactor: BitcoinInteractorInput
    let coordinator: BitcoinCoordinatorInput
    weak var output: BitcoinPresenterOutput?

    init(interactor: BitcoinInteractorInput, coordinator: BitcoinCoordinatorInput) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
}

// MARK: - User Events -

extension BitcoinPresenter: BitcoinPresenterInput {
    func viewCreated() {

    }
}

// MARK: - Presentation Logic -

// INTERACTOR -> PRESENTER (indirect)
extension BitcoinPresenter: BitcoinInteractorOutput {

}
