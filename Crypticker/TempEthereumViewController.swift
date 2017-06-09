//
//  TempEthereumViewController.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 31/05/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import UIKit
import CryptoCurrencyKit
import UserNotifications
import Serpent
import Alamofire



class TempEthereumViewController: UIViewController {
    
    
    @IBOutlet weak var DayLabel: UILabel!
    @IBOutlet weak var PriceOnDayLabel: UILabel!
    @IBOutlet weak var PriceChangeLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    
    @IBOutlet weak var label: UILabel!
    
    
    
    /* Later re-organie model -> coordinator -> Clean Arcitecture */
    
    //1. Model
    //2. Make API request -> Store in dict<>
    //3. request pr timer
    
    //4. algorihtmen to calcuæate average, and with timer
    //5. check if price is going down or up in percentage
    //6.. if >< 5 %  then Display notification (Widget extension , Update Graph)
    
    
    //Change notification to 2 outcome ,  + ,  -

    
    
    /***** Background fetch ****/
    func fetch(_ completion: () -> Void ) {
        completion()
    }
    
    func updateUI() {
        guard label != nil  else {
            return
        }
    }
    
    
    
    let baseURLEthereum = URL(string: "https://api.coinmarketcap.com/v1/ticker/?convert=EUR&limit=100")!
    
    func makeEthereumDataRequest(completion: @escaping (DataResponse<[EthereumCurrency]>) -> Void) {
        print("Ethereum Data Repsonse ")
        request(baseURL_Ethereum!).responseSerializable(completion)
    }
    
    
    func requestEthereumData(){
        makeEthereumDataRequest{ (response) in
            switch response.result {
                
            case .success(let ethereumData):
                
                for eth in ethereumData {

                    print("All Currency Names \(eth.name) \n ")
                    print("All Ranks \(eth.rank)")
                    print("Percent Change_1 Hour \(eth.percent_change_1h)")
                    print("Percent Change_24 Hours \(eth.percent_change_24h)")
                    print("Percent Change_7 Days \(eth.percent_change_7d)")
                    print("Crpyto Price in USD \(eth.price_usd)")
                    print("Total Supply  \(eth.availible_supply)")
                
                    //CHeck for update in price and compare old price (global var) to new request price (cache)
                     self.priceCompareFromCache()
                }
                
            case .failure(let error):
                print("Ethereum reqeust failed: \(error.localizedDescription)")
            }
        }
        
    }
    


    
    //Temp for testing - (Modify to real price from API )
    var btcPrice: Double  = 10.00
    var btcCachedPrice: Double = 20.00
    

    //Compare old Price(cached) to new Request
    func priceCompareFromCache() {
        
        if (btcPrice >= btcCachedPrice ) {
            updateNotificationPriceChangeUp()
        } else {
            updateNotificationPriceChangeDown()
        }
    }
    
    
        //Updates Notification to User if Price - UP
    func updateNotificationPriceChangeUp() {
        scheduleNotification(inSeconds: 1) { (true) in
           // print("Notification for BitcoinPrice - UP")
        }
    }
    
        //Updates Notification to User if Price - DOWN
    func updateNotificationPriceChangeDown() {
        scheduleNotification(inSeconds: 1) { (true) in
            //print("Notification for Bitcoin Price -  DOWN ")
        }
    }
    
  


    @IBAction func btnNotifiTest(_ sender: Any) {
        scheduleNotification(inSeconds: 5, completion: { success in
            
            if success {
                print("Successfully scheduled notification ")
            } else {
                print("Error scheduling notification ")
            }
        
        })
    }
    
    
    func scheduleNotification(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool ) -> ()) {
        
        // Add an attachement
        let bitcoinGif = "bitcoingif"
        
        guard let imageBitcoinUrl = Bundle.main.url(forResource: bitcoinGif, withExtension: "gif") else {
            completion(false )
            print("failed to find gif")
            return
        }
        
        
        var attachment: UNNotificationAttachment
        attachment = try! UNNotificationAttachment(identifier: "bitcoinNotification", url: imageBitcoinUrl, options: .none)
 
        
        let notification = UNMutableNotificationContent()
        
        //Only for EXTENSION 
        notification.categoryIdentifier = "bitcoinNotificationCategory"
        
        
        notification.title = "New Price evalutaiton"
        notification.subtitle = "Bitcoin raised + 5%"
        notification.body = " New Price Notification"
        notification.sound = UNNotificationSound(named: "upsound.waw")
        notification.attachments = [attachment]
        

        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "bitcoinNotification", content: notification, trigger: notificationTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if error != nil {
                print(error)
                completion(false)
            } else {
                completion(true)
            }
        })
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                print("Success access grantd")
            } else {
                print(error?.localizedDescription)
            }
        }
        
    
        print("tempEthereum VC - Default")

        updateUI()
        requestEthereumData()
      
        
         //registerBackgroundTask()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
/*
    func updateDayLabel(_ price: EthereumPrice) {
     
    }
  */
    

    


}





/***-----BACKGROUND TASK----------
 
 //Initilaize background mode
 var backgroundTask: UIBackgroundTaskIdentifier = UIBackgroundTaskInvalid
 
 
 func registerBackgroundTask() {
 backgroundTask = UIApplication.shared.beginBackgroundTask { [weak self] in
 self?.endBackgroundTask()
 }
 assert(backgroundTask != UIBackgroundTaskInvalid)
 }
 
 
 
 func endBackgroundTask() {
 print("Background task ended ")
 
 UIApplication.shared.endBackgroundTask(backgroundTask)
 backgroundTask = UIBackgroundTaskInvalid
 
 if (backgroundTask != UIBackgroundTaskInvalid) {
 endBackgroundTask()
 }
 }
 
 
 func setMinimumBackgroundFetchInterval(_:) {
 
 }
 
 
 -----BACKGROUND TASK--END-------******/
