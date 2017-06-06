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


//Refresh API CAll on refresh -> touch down 



class TodayEthViewController: CurrencyDataViewController, NCWidgetProviding {
    
    
    let baseURL_Price = URL (string: "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH,DASH,XRP&tsyms=BTC,USD,EURO")! //Add parameters in the url for more data request
   // let baseURL_Price = URL (string: "https://api.coinmarketcap.com/v1/ticker/?convert=EUR&limit=100")!
    
    
    @IBOutlet weak var ethPriceLbl: UILabel!
    
    @IBOutlet weak var ethPriceChangeLbl: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
    
        requestEthereumPrice { (response) in
            switch response.result {
                
            case .success (let exchangeRate):
       
                
                
                
               for currency in exchangeRate.currencies {
                
                
                    // print("Currenct XRP \(exchangeRate.currencies)")
                /*if let name = exchangeRate.RAW[keyPath: "price.eth"] as? String {
                    print(name)
                } */
                
             print("Looping through Exchanges exchangeRate.currencies: \(exchangeRate.currencies)")
                
                
               
                
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    
    /* API data respond
     if let Ethereum = currency.eth["USD"] as? Dictionary <String, Any> {
     print(Ethereum)
     }
     //print("Currency Data from ETHEREUM: \(currency.eth)")
     //print("Currency Data from DASH: \(currency.change24Hour)")
     */

    
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
        request(baseURL_Price).responseSerializable(completion)
        
    }
    
    
    
    
}
