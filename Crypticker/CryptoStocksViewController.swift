//
//  CryptoStocksViewController.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 22/06/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import UIKit

class CryptoStocksViewController: UIViewController {

    let presenter: CryptoStocksPresenterInput

    convenience init(presenter: CryptoStocksPresenterInput) {
        self.init(presenter: presenter, nibName: nil, bundle: nil)
    }

    init(presenter: CryptoStocksPresenterInput, nibName: String?, bundle: Bundle?) {
        self.presenter = presenter
        super.init(nibName: nibName, bundle: bundle)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewCreated()
    }

    // MARK: - Callbacks -

}

// MARK: - Display Logic -

// PRESENTER -> VIEW
extension CryptoStocksViewController: CryptoStocksPresenterOutput {

}
