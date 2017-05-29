//
//  BitcoinInteractor.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 29/05/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation


class BitcoinInteractor {
    weak var output: BitcoinInteractorOutput?
}

// MARK: - Business Logic -

// PRESENTER -> INTERACTOR
extension BitcoinInteractor: BitcoinInteractorInput {
}
