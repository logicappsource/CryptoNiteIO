//
//  CryptoStocksProtocols.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 22/06/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import UIKit

// ======== Coordinator ======== //

//protocol CryptoStocksCoordinatorDelegate: class {
//    func coordinator(_ coordinator: Coordinator, finishedWithSuccess success: Bool)
//}

// PRESENTER -> COORDINATOR
protocol CryptoStocksCoordinatorInput {

}

// ======== Interactor ======== //

// PRESENTER -> INTERACTOR
protocol CryptoStocksInteractorInput {
    // func perform(_ request: CryptoStocks.Request.Work)
}

// INTERACTOR -> PRESENTER (indirect)
protocol CryptoStocksInteractorOutput: class {
    // func present(_ response: CryptoStocks.Response.Work)
}

// ======== Presenter ======== //

// VIEW -> PRESENTER
protocol CryptoStocksPresenterInput {
    func viewCreated()
}

// PRESENTER -> VIEW
protocol CryptoStocksPresenterOutput: class {
    // func display(_ displayModel: CryptoStocks.DisplayData.Work)
}
