//
//  ProfileViewController.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 21/06/2017.
//  Copyright (c) 2017 LogicAppSourceIO. All rights reserved.  //presenter communicater kun fra viewvVC
import UIKit

class ProfileViewController: UIViewController {
    
    /******* NEEDS TO BE IMPLEMENTED *****/
    //1. Conform to protocol and delegate -> User () Struct
    //2. returning coins -> other VC -> NIB FILE
    //3.  Store  id for a USER
    
    
    var sKey = ""
    var currentValue: Double = 23.0
    
    @IBOutlet weak var JSONApiTxtField: UITextField!
    @IBOutlet weak var lblDisplayPercent: UILabel!
    
    @IBAction func sliderPercentNotifi(_ sender: UISlider) {
        var currenctValue = Double(sender.value).roundTo(places: 2)
        lblDisplayPercent.text = "\(currenctValue)"
        fetchUserSettings(currentValue: currentValue)
    }
    
    
    func fetchUserSettings(currentValue: Double) -> Double {
        let notifValue = currentValue
        print(notifValue)
        return notifValue
    }
    
    //Store for the specific User -> API to an ID ...
    @IBAction func btnApi(_ sender: Any) {
        var key: String?
        JSONApiTxtField.text? = sKey
        concatApiKeyFromUser(sKey: sKey)
        presenter.getData()
    }
    
    
    func concatApiKeyFromUser(sKey: String) -> String {
        var sLink = "https://spreadsheets.google.com/feeds/list/\(sKey)/1/public/full?alt=json"
        return sLink
    }
    
    let presenter: ProfilePresenterInput

    convenience init(presenter: ProfilePresenterInput) {
        self.init(presenter: presenter, nibName: nil, bundle: nil)
    }

    init(presenter: ProfilePresenterInput, nibName: String?, bundle: Bundle?) {
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
extension ProfileViewController: ProfilePresenterOutput {
    
    func display(_ displayModel: Profile.DisplayData.Currency) {
       /*
        print("\(displayModel.btc)  + \(displayModel.btcValue)  \n ")
        print("\(displayModel.xrp)  +  \(displayModel.xrpValue) \n")
        print("\(displayModel.eth)  +  \(displayModel.ethValue) \n ")
        print("\(displayModel.dash) +  \(displayModel.dashValue) \n ")
        print("\(displayModel.etc)+  \(displayModel.etcValue) \n")
        print("\(displayModel.strat) + \(displayModel.stratValue) \n ")
        print("\(displayModel.xem)  +  \(displayModel.xemValue) \n ")
        print("\(displayModel.ltc)  +  \(displayModel.ltcValue) \n ")
        print("\(displayModel.xmr)  +  \(displayModel.xmrValue) \n ")
        print("\(displayModel.zec)  +  \(displayModel.zecValue) \n ")
        print("\(displayModel.gnt)  +  \(displayModel.gntValue) \n ")
        print("\(displayModel.sc)  +  \(displayModel.scValue) \n ")
        print("\(displayModel.xlm)  +  \(displayModel.xlmValue) \n ")
        print("\(displayModel.wawes)  +  \(displayModel.wawesValue) \n ")
        print("\(displayModel.bcn)  +  \(displayModel.bcnValue) \n ")
        */
    }
    
    func display(_ error: Profile.DisplayData.Error) {
        let alert = UIAlertController(title: "Fejl!", message: error.message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }

}




// Rounds Double to decimal places value
extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}









