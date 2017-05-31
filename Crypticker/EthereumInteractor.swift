//
//  EthereumInteractor.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 31/05/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation

class EthereumInteractor {
    weak var output: EthereumInteractorOutput?
}

// MARK: - Business Logic -

// PRESENTER -> INTERACTOR
extension EthereumInteractor: EthereumInteractorInput {
}
