//
//  BitcoinProtocols.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 29/05/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import UIKit

// ======== Coordinator ======== //

//protocol BitcoinCoordinatorDelegate: class {
//    func coordinator(_ coordinator: Coordinator, finishedWithSuccess success: Bool)
//}

// PRESENTER -> COORDINATOR
protocol BitcoinCoordinatorInput {

}

// ======== Interactor ======== //

// PRESENTER -> INTERACTOR
protocol BitcoinInteractorInput {
    // func perform(_ request: Bitcoin.Request.Work)
}

// INTERACTOR -> PRESENTER (indirect)
protocol BitcoinInteractorOutput: class {
    // func present(_ response: Bitcoin.Response.Work)
}

// ======== Presenter ======== //

// VIEW -> PRESENTER
protocol BitcoinPresenterInput {
    func viewCreated()
}

// PRESENTER -> VIEW
protocol BitcoinPresenterOutput: class {
    // func display(_ displayModel: Bitcoin.DisplayData.Work)
}
