//
//  CryptoStocksCoordinator.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 22/06/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import UIKit

class CryptoStocksCoordinator: Coordinator {
    let navigationController: UINavigationController
    var children: [Coordinator] = []
//    weak var delegate: CryptoStocksCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let interactor = CryptoStocksInteractor()
        let presenter = CryptoStocksPresenter(interactor: interactor, coordinator: self)
        let vc = CryptoStocksViewController(presenter: presenter)

        interactor.output = presenter
        presenter.output = vc

        // FIXME: Display as you need
        // navigationController.setViewControllers([vc], animated: false)
    }
}

// PRESENTER -> COORDINATOR
extension CryptoStocksCoordinator: CryptoStocksCoordinatorInput {

}
