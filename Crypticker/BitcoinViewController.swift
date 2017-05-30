//
//  BitcoinViewController.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 29/05/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.
//

import UIKit

class BitcoinViewController: UIViewController {

    let presenter: BitcoinPresenterInput

    convenience init(presenter: BitcoinPresenterInput) {
        self.init(presenter: presenter, nibName: nil, bundle: nil)
    }

    init(presenter: BitcoinPresenterInput, nibName: String?, bundle: Bundle?) {
        self.presenter = presenter
        super.init(nibName: nibName, bundle: bundle)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestCryptoCurrencies()
        presenter.viewCreated()
    }

    // MARK: - Callbacks -

}

// MARK: - Display Logic -

// PRESENTER -> VIEW
extension BitcoinViewController: BitcoinPresenterOutput {

}
