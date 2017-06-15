//
//  TodayEthViewController.swift
//  ETH Widget
//
//  Created by LogicAppSourceIO on 31/05/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import UIKit
import NotificationCenter
import CryptoCurrencyKit
import Serpent
import Alamofire


class TodayEthViewController: CurrencyDataViewController, NCWidgetProviding {
    
    
let baseURL_Price = URL (string: "https://api.coinmarketcap.com/v1/ticker/?convert=EUR&limit=100")
    
    
    @IBOutlet weak var ethPriceLbl: UILabel!
    @IBOutlet weak var ethPriceChangeLbl: UILabel!

    var lineWidth: CGFloat = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        print("ETH Widget Initialized")
        
        requestEthereumPrice { (response) in
            switch response.result {
                
            case .success (let exchangeRate):
       
               for currency in exchangeRate.ethereum {
                print("Looping through Exchanges exchangeRate.currencies: \(exchangeRate.ethereum)")
                print(exchangeRate.price_usd)
                
                self.ethPriceLbl.text = "$ \(exchangeRate.price_usd)"
                self.ethPriceChangeLbl.text =  "% \(exchangeRate.percent_change_1h)"
                
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
        

    }
    
   override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        completionHandler(NCUpdateResult.newData)
    }
    
    
    
    //GET Ethereum Endpoint - API
    func requestEthereumPrice(completion: @escaping (DataResponse<ExchangeRate>) -> Void) {
        request(baseURL_Price!).responseSerializable(completion)
        
    }
    
    
    
    
}
