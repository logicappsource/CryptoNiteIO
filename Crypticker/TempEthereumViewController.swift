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
    
    
    
    //1. Model
    //2. Make API request -> Store in dict<>
    //3. request pr timer
    
    /* Later Move to model -> + coordinator*/
    
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
                   // print("Ethereum Currency:   \(eth.last_24h_volume_usd)")
                    print("All Currency Names \(eth.name) \n ")
                    print("All Ranks \(eth.rank)")
                    print("Percent Change_1 Hour \(eth.percent_change_1h)")
                    print("Percent Change_24 Hours \(eth.percent_change_24h)")
                    print("Percent Change_7 Days \(eth.percent_change_7d)")

                    
                }
                
            case .failure(let error):
                print("Ethereum reqeust failed: \(error.localizedDescription)")
                
            }
        }
        
    }
    
    

    
    //1. algorihtmen to calcuæate average, and with timer
    //2. check if price is going down or up in percentage 
    //3.. if >< 5 %  then Display notification 
    
    
    
    //Call this method if price goes up ->
    //scheduleNotification(inSeconds: 5, completion: { success in

    
    
    
    
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
    
    
    
    
    /* Implementaiton*/
    //Make ETH api call 
    //request Price
    //display price 
    //Jlinechart implement
    //Refresh and fetch price
    
    
    
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
        
    
        print("new Ethereum VC")
        
        requestEthereumData()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    func updateDayLabel(_ price: EthereumPrice) {
     
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



}
