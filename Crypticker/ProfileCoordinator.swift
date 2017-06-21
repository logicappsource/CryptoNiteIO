//
//  ProfileCoordinator.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 21/06/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    let navigationController: UINavigationController
    var children: [Coordinator] = []
//    weak var delegate: ProfileCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let repo = ConnectionManager()
        let interactor = ProfileInteractor(repository: repo)
        let presenter = ProfilePresenter(interactor: interactor, coordinator: self)
        let vc = ProfileViewController(presenter: presenter)

        interactor.output = presenter
        presenter.output = vc

        // FIXME: Display as you need
        navigationController.setViewControllers([vc], animated: false)
    }
}

// PRESENTER -> COORDINATOR
extension ProfileCoordinator: ProfileCoordinatorInput {

}
