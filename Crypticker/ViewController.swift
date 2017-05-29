/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit
import CryptoCurrencyKit

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

