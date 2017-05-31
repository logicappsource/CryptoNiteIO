//
//  EthereumCoordinator.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 31/05/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import UIKit

class EthereumCoordinator: Coordinator {
    let navigationController: UINavigationController
    var children: [Coordinator] = []
//    weak var delegate: EthereumCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let interactor = EthereumInteractor()
        let presenter = EthereumPresenter(interactor: interactor, coordinator: self)
        let vc = EthereumViewController(presenter: presenter)

        interactor.output = presenter
        presenter.output = vc

        // FIXME: Display as you need
        // navigationController.setViewControllers([vc], animated: false)
    }
}

// PRESENTER -> COORDINATOR
extension EthereumCoordinator: EthereumCoordinatorInput {

}
