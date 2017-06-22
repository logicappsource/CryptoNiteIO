//
//  CryptoStocksPresenter.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 22/06/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation

class CryptoStocksPresenter {
    let interactor: CryptoStocksInteractorInput
    let coordinator: CryptoStocksCoordinatorInput
    weak var output: CryptoStocksPresenterOutput?

    init(interactor: CryptoStocksInteractorInput, coordinator: CryptoStocksCoordinatorInput) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
}

// MARK: - User Events -

extension CryptoStocksPresenter: CryptoStocksPresenterInput {
    func viewCreated() {

    }
}

// MARK: - Presentation Logic -

// INTERACTOR -> PRESENTER (indirect)
extension CryptoStocksPresenter: CryptoStocksInteractorOutput {

}
