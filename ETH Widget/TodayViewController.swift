//
//  TodayViewController.swift
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


class TodayViewController: CurrencyDataViewController, NCWidgetProviding {
    
    
    
    
    @IBOutlet weak var EthPriceLbl: UILabel!
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        //lineChartView.delegate = self
        //lineChartView.dataSource = self
        
        print("Ethereum view loaded")
        
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
    func requestEthereumPrice(completion: @escaping(DataResponse<ExchangeRate>) -> Void ){
        
    }
    
    
    
    
}
