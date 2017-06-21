//
// BTC ViewController.swift
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

class ViewController: CurrencyDataViewController {
  
  let dateFormatter: DateFormatter
  
  required init?(coder aDecoder: NSCoder) {
    dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEE M/d"
    
    super.init(coder: aDecoder)
  }
    
    
  let baseURLBitcoin = URL(string: "https://api.coinmarketcap.com/v1/ticker/?convert=EUR&limit=100")!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    lineChartView.dataSource = self
    lineChartView.delegate = self
    requestBtcData()
    
    priceOnDayLabel.text = ""
    dayLabel.text = ""
    
    }
    
  
    func makeBitcoinDataRequest(completion: @escaping (DataResponse <[bitcoinCurrency]>) -> Void) {
     request(baseURLBitcoin).responseSerializable(completion)
    }
    
    
    
    
    func requestBtcData() {
        makeBitcoinDataRequest{ (response) in
            switch response.result {
            case .success(let bitcoinData):
            
            for currency in bitcoinData {
                if(currency.name == "Bitcoin") {
                    print(" Bitcoin pecent change 1h \(currency.percent_change_1h)")
                    print(" Bitcoin Price USD  \(currency.price_usd)")
                }
            }
            case .failure(let error):
            print(error.localizedDescription)
            }
        }
    }
    
  
  override func viewWillAppear(_ animated: Bool)  {
    super.viewWillAppear(animated)
    
    fetchPrices { error in
      if error == nil {
        self.updatePriceLabel()
        self.updatePriceChangeLabel()
        self.updatePriceHistoryLineChart()
      }
    }
  }
    
    
    
    func scheduleNotificationBtcUp(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool ) -> ()) {
        
        //Add an Attachment
        let bitcoinUp = "bitcoingif"
        
        guard let imageBtcUp = Bundle.main.url(forResource: bitcoinUp, withExtension: "gif") else {
            completion(false)
            print("failed to find  btc gif")
            return
        }
        
        var attachment: UNNotificationAttachment
        attachment = try! UNNotificationAttachment(identifier: "btcUpNotification", url: imageBtcUp, options: .none)
        
        let notification = UNMutableNotificationContent()
        
        //Only for extension 
        notification.categoryIdentifier = "btcNotificationCategory"
        notification.title = "New Price Up Valuation "
        notification.subtitle = "Btc Increased + %5"
        notification.body = "New Bitcoin Notification"
        notification.sound = UNNotificationSound(named: "upsound.waw")
        notification.attachments = [attachment]
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        let request = UNNotificationRequest(identifier: "btcUpNotification", content: notification, trigger: notificationTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler:  { error in
            if error != nil {
                print(error)
                completion(false)
            } else {
                completion(true)
            }
        })
        
    }
    
    
    
    
    func scheduleNotificationBtcDown(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool ) -> ()) {
            //Add an Attachment 
        let bitcoinDown = "btcdrop"
        
        guard let imageBtcDown = Bundle.main.url(forResource: bitcoinDown, withExtension: "png") else {
            completion(false)
            print("Couldent locate image")
            return
        }
        
        var attachment: UNNotificationAttachment
        attachment = try! UNNotificationAttachment(identifier: "btcDownNotification", url: imageBtcDown, options: .none)
        
        let notification = UNMutableNotificationContent()
        
        //only for extension 
        notification.categoryIdentifier = "btcNotificationCategory"
        notification.title = "New Price Up valuation"
        notification.subtitle = "Btc increased + 5% "
        notification.body = "New Bitcoin Notification"
        notification.sound = UNNotificationSound(named: "upsound.waw")
        notification.attachments = [attachment]
        
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        let request = UNNotificationRequest(identifier: "btcDownNotification", content: notification, trigger:notificationTrigger )
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler:  { error in
            if error != nil {
                completion(false)
                print(error)
            } else {
                completion(true)
            }
        })
        
    }
    
    
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    self.lineChartView.reloadData()
  }

  func updateDayLabel(_ price: BitCoinPrice) {
    dayLabel.text = dateFormatter.string(from: price.time)
  }
  
  // MARK: - JBLineChartViewDataSource & JBLineChartViewDelegate
  
  func lineChartView(_ lineChartView: JBLineChartView!, didSelectLineAtIndex lineIndex: UInt, horizontalIndex: UInt) {
    if let prices = prices {
      let price = prices[Int(horizontalIndex)]
      updatePriceOnDayLabel(price)
      updateDayLabel(price)
    }
  }
  
  func didUnselectLineInLineChartView(_ lineChartView: JBLineChartView!) {
    priceOnDayLabel.text = ""
    dayLabel.text = ""
  }
  
}

