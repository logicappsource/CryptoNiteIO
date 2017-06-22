//
//  ProfileProtocols.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 21/06/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import UIKit

// ======== Coordinator ======== //

//protocol ProfileCoordinatorDelegate: class {
//    func coordinator(_ coordinator: Coordinator, finishedWithSuccess success: Bool)
//}

// PRESENTER -> COORDINATOR
protocol ProfileCoordinatorInput {

}

// ======== Interactor ======== //

// PRESENTER -> INTERACTOR
protocol ProfileInteractorInput {
     func perform(_ request: Profile.Request.Currency)
}

// INTERACTOR -> PRESENTER (indirect)
protocol ProfileInteractorOutput: class {
    func present(_ response: Profile.Response.Currency)
}

// ======== Presenter ======== //

// VIEW -> PRESENTER
protocol ProfilePresenterInput {
    func viewCreated()
    func getData()
}

// PRESENTER -> VIEW
protocol ProfilePresenterOutput: class {
    func display(_ displayModel: Profile.DisplayData.Currency)
    func display(_ error: Profile.DisplayData.Error)
}
