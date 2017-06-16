//
//  TempEthereumViewController.swift
//  CryptoNiteIO
//
//  Created by LogicAppSourceIO on 31/05/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

/*****  IMPLEMENT LATER ******/
//Cach price
//let ethPriceCached = NSCache<NSString, Double>()


/* Later re-organie model -> coordinator -> Clean Arcitecture */

//1. Model
//2. Make API request -> Store in dict<>
//3. request pr timer

//4. algorihtmen to calcuæate average, and with timer
//5. check if price is going down or up in percentage
//6.. if >< 5 %  then Display notification (Widget extension , Update Graph)
//7. Put specific price into Notification (up,down)

import UIKit
import CryptoCurrencyKit
import UserNotifications
import Serpent
import Alamofire



class TempEthereumViewController: CurrencyDataViewController {
    
    let baseURLEthereum = URL(string: "https://api.coinmarketcap.com/v1/ticker/?convert=EUR&limit=100")!
    let dateFormatter: DateFormatter
    
    // Hardcoded Temp test
    var btcPrice: Double  = 10.00
    var btcCachedPrice: Double = 20.00
    
    required init?(coder aDecoder: NSCoder) {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE M/d"
        
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var DayLabel: UILabel!
    @IBOutlet weak var PriceOnDayLabel: UILabel!
    @IBOutlet weak var PriceChangeLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var priceLblEth: UILabel!
    @IBOutlet weak var priceChangeLblEth: UILabel!
    
    @IBOutlet weak var label: UILabel! // test label
    
    /*
    func updateDayLabel(_ price: EthereumPrice) {
        DayLabel.text = dateFormatter.string(from: price.time)
    }*/
    
    
    /***** Background fetch ****/
    func fetch(_ completion: () -> Void ) {
        completion()
    }
    
    func updateUI() {
        guard label != nil  else {
            return
        }
    }
    

    
    func makeEthereumDataRequest(completion: @escaping (DataResponse<[EthereumCurrency]>) -> Void) {
        request(baseURL_Ethereum!).responseSerializable(completion)
    }
    
    

    
    func requestEthereumData(){
        makeEthereumDataRequest{ (response) in
            switch response.result {
                
            case .success(let ethereumData):
                
                for currency in ethereumData {
                    
                    if(currency.name == "Ethereum") {
                        self.priceLblEth.text = " $ \(currency.price_usd)"
                        self.priceChangeLblEth.text = "% \(currency.percent_change_1h)"
                        
                        //Cast -> Double
                        if let newEthPercent_Change_1h_double = NumberFormatter().number(from: currency.percent_change_1h)?.doubleValue {
                            print("\n New ETH Price %  \(newEthPercent_Change_1h_double)")
                            
                        if(abs(newEthPercent_Change_1h_double) >= 5.0) {  //Compare Price
                                self.updateNotificationPriceChangeUp()
                            
                        } else if (abs(newEthPercent_Change_1h_double) <= 5.0) {  //  check for minus value ->   || (abs(newEthPercent_Change_1h_double) <= 2.5)
                                self.updateNotificationPriceChangeDown()
                            }
                        }
                    
                    }
                }
                
            case .failure(let error):
                print("Ethereum reqeust failed: \(error.localizedDescription)")
            }
        }
        
    }
    
    

        //Updates Notification to User if Price - UP
    func updateNotificationPriceChangeUp() {
        print("Price Alert Notified - Ethereum Price increasd more than %5 ")
        scheduleNotificationEthUp(inSeconds: 1) { (true) in
        }
    }
    
        //Updates Notification to User if Price - DOWN
    func updateNotificationPriceChangeDown() {
        print("Price Alert Notificed - Ethereum Price dropped more than %5 ")
        scheduleNotificationEthDown(inSeconds: 1) { (true) in
        }
    }
    
  

    @IBAction func btnNotifiTest(_ sender: Any) {
       scheduleNotificationEthUp(inSeconds: 5, completion: { success in
            if success {
                print("Successfully scheduled notification ")
            } else {
                print("Error scheduling notification ")
            }
        
        })
    }
    
    
    
    
    func scheduleNotificationEthDown(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool ) -> ()) {
        
        //Add An Attachment 
        let ethereumDown = "ethereumDown"
        
        guard let imageEthDown = Bundle.main.url(forResource: ethereumDown, withExtension: "png") else {
            completion(false)
            print("failed to find png")
            return
        }
        
        var attachment: UNNotificationAttachment
        attachment = try! UNNotificationAttachment(identifier: "ethereumDownNotification", url: imageEthDown, options: .none)
        
        let notification = UNMutableNotificationContent()
        
        //Only for extension 
        notification.categoryIdentifier = "ethereumNotificationCategory"
        
        notification.title = "New Price Drop evaluation"
        notification.subtitle = "Ethereum Dropped - %5"
        notification.body = " New Ethereum Notification"
        notification.sound = UNNotificationSound(named: "upsound.waw")
        notification.attachments = [attachment]
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        let request = UNNotificationRequest(identifier: "ethereumDownNotification", content: notification, trigger: notificationTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler:  { error in
            if error != nil {
                print(error)
                completion(false)
            } else {
                completion(true)
            }
        })
        
    }
    
    
    
    
    func scheduleNotificationEthUp(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool ) -> ()) {
        
        // Add an attachement
        let ethereumGif = "ethereum"
        
        guard let imageEthUrl = Bundle.main.url(forResource: ethereumGif, withExtension: "gif") else {
            completion(false )
            print("failed to find gif")
            return
        }
        
        
        var attachment: UNNotificationAttachment
        attachment = try! UNNotificationAttachment(identifier: "ethereumNotification", url: imageEthUrl, options: .none)
 
        let notification = UNMutableNotificationContent()
        
        //Only for EXTENSION 
        notification.categoryIdentifier = "ethereumNotificationCategory"
        
        
        notification.title = "New Price evalutaiton"
        notification.subtitle = "Ethereum increase + 5%"
        notification.body = " New Price Notification"
        notification.sound = UNNotificationSound(named: "upsound.waw")
        notification.attachments = [attachment]
        
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "ethereumNotification", content: notification, trigger: notificationTrigger)
        
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
