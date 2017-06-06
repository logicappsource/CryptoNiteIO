

import UIKit
import CryptoCurrencyKit
import UserNotifications

class ViewController: CurrencyDataViewController {
  
  let dateFormatter: DateFormatter
  
  required init?(coder aDecoder: NSCoder) {
    dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEE M/d"
    
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    lineChartView.dataSource = self
    lineChartView.delegate = self
    
    priceOnDayLabel.text = ""
    dayLabel.text = ""
    
    //Comment out
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { (granted, error) in
        
                if granted {
                    print("Authroized access granted")
                } else {
                    print(error?.localizedDescription)
                }
        })
    
    
    
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

