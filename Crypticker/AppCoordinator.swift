//
//  AppCoordinator.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 29/05/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {

    let window: UIWindow
    var children: [Coordinator] = []

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        // Perform initial application seutp.
        setupAfterLaunch()

        // Start your first flow here. For example, this is the
        // ideal place for deciding if you should show login or main flows.
        showMain()

        // Finally make the window key and visible.
        window.makeKeyAndVisible()
    }

    // MARK: - Flows -

    func showMain() {
        let navVC = UINavigationController()
        let profileCoordinator = ProfileCoordinator(navigationController: navVC)
        profileCoordinator.start()
        children.append(profileCoordinator)
        window.rootViewController = navVC
    }

    // MARK: - Additional Setup -

    func setupAfterLaunch() {
        // Perform initial app setup after launch like analytics, integrations and more.
    }
}
