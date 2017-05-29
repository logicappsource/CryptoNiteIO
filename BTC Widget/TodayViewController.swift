//
//  TodayViewController.swift
//  BTC Widget
//
//  Created by LogicAppSourceIO on 29/05/2017.
//  Copyright © 2017 LogicAppSourceIO. All rights reserved.
//

import UIKit
import NotificationCenter
import CryptoCurrencyKit


class TodayViewController: CurrencyDataViewController, NCWidgetProviding {

    
    //Line Width -> (color to white modifed here
    var lineWidth: CGFloat = 2.0

    @IBOutlet weak var priceSelectionVibrancyView: UIVisualEffectView!
    
    @IBOutlet weak var vibrancyView: UIVisualEffectView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        lineChartView.delegate = self
        lineChartView.dataSource = self
        
        priceLabel.text = "--"
        priceChangeLabel.text = "--"
        
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        
        vibrancyView.effect = UIVibrancyEffect.widgetPrimary()
        priceSelectionVibrancyView.effect = UIVibrancyEffect.widgetSecondary()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchPrices { error in
            if error == nil {
                self.updatePriceLabel()
                self.updatePriceChangeLabel()
                self.updatePriceHistoryLineChart()
                }
            }
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updatePriceHistoryLineChart()
    }
    
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        let expanded = activeDisplayMode == .expanded
        preferredContentSize = expanded ? CGSize(width: maxSize.width, height: 200) : maxSize
        toggleLineChart()
        
    }
    
    override func lineChartView(_ lineChartView: JBLineChartView!, colorForLineAtLineIndex lineIndex: UInt) -> UIColor! {
        return lineChartView.tintColor
    }
    
    
    private func toggleLineChart () {
        let expanded = extensionContext!.widgetActiveDisplayMode == .expanded
        if expanded {
            lineWidth = 4.0
            priceOnDayLabel.isHidden = false
        } else {
            lineWidth = 2.0
            priceOnDayLabel.isHidden = true
        }
        priceOnDayLabel.text = ""
    }
    
    override func lineChartView(_ lineChartView: JBLineChartView!, widthForLineAtLineIndex lineIndex: UInt) -> CGFloat {
        return lineWidth
    }

    
    func lineChartView(_ lineChartView: JBLineChartView!, didSelectLineAtIndex lineIndex: UInt, horizontalIndex: UInt) {
        if let prices = prices {
            let price = prices[Int(horizontalIndex)]
            updatePriceOnDayLabel(price)
            print(price)
        }
    }
    
    func didUnselectLineInLineChartView(_ lineChartView: JBLineChartView!) {
        priceOnDayLabel.text = ""
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
    
}
