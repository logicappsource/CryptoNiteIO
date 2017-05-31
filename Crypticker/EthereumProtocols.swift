//
//  EthereumProtocols.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 31/05/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import UIKit

// ======== Coordinator ======== //

//protocol EthereumCoordinatorDelegate: class {
//    func coordinator(_ coordinator: Coordinator, finishedWithSuccess success: Bool)
//}

// PRESENTER -> COORDINATOR
protocol EthereumCoordinatorInput {

}

// ======== Interactor ======== //

// PRESENTER -> INTERACTOR
protocol EthereumInteractorInput {
    // func perform(_ request: Ethereum.Request.Work)
}

// INTERACTOR -> PRESENTER (indirect)
protocol EthereumInteractorOutput: class {
    // func present(_ response: Ethereum.Response.Work)
}

// ======== Presenter ======== //

// VIEW -> PRESENTER
protocol EthereumPresenterInput {
    func viewCreated()
}

// PRESENTER -> VIEW
protocol EthereumPresenterOutput: class {
    // func display(_ displayModel: Ethereum.DisplayData.Work)
}
