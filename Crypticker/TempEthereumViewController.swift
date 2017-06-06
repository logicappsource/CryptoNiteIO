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

class TempEthereumViewController: UIViewController {
    
    
    
    @IBOutlet weak var DayLabel: UILabel!
    @IBOutlet weak var PriceOnDayLabel: UILabel!
    @IBOutlet weak var PriceChangeLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    
    
    
    
    
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
