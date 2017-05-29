//
//  BitcoinCoordinator.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 29/05/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import UIKit


class BitcoinCoordinator: Coordinator {
    let navigationController: UINavigationController
    var children: [Coordinator] = []
//    weak var delegate: BitcoinCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let interactor = BitcoinInteractor()
        let presenter = BitcoinPresenter(interactor: interactor, coordinator: self)
        let vc = BitcoinViewController(presenter: presenter)

        interactor.output = presenter
        presenter.output = vc

        // FIXME: Display as you need
        // navigationController.setViewControllers([vc], animated: false)
    }
}

// PRESENTER -> COORDINATOR
extension BitcoinCoordinator: BitcoinCoordinatorInput {

}

