//
//  ResultsScreenViewController.swift
//  MySpace
//
//  Created by Veer Doshi on 8/18/18.
//  Copyright © 2018 Veer Doshi. All rights reserved.
//

import UIKit
import SwiftCharts
import SwiftyJSON
import SwiftSpinner

class ResultsScreenViewController: UIViewController {

    var result: JSON = []
    
    @IBOutlet weak var lblScore: UILabel!
    
    @IBOutlet weak var lblCreditHealth: UILabel!
    
    var chartView : BarsChart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let chartConfig = BarsChartConfig(valsAxisConfig: ChartAxisConfig(from: 0, to: 800, by: 100))
        
        let frame = CGRect(x: 0, y: 270, width: self.view.frame.width, height: 450)
        
        let lightBlue = UIColor(red: 77, green: 169, blue: 226, alpha: 0.7)

        
        let chart = BarsChart(frame: frame, chartConfig: chartConfig, xTitle: "Months", yTitle: "Units Sold", bars: [("One", 470), ("Two", 570), ("Three", 670), ("Four", 770)], color: UIColor.red, barWidth: 50)
//        setChartValues()
        
        self.view.addSubview(chart.view)
        self.chartView = chart
        
        var creditScore = self.result["creditScore"].string
        var creditStatus = self.result["creditStatus"].string
        var creditMatrix = self.result["creditMatrix"]
        
        self.lblScore.text = creditScore
        self.lblCreditHealth.text = creditStatus
        
        print(self.result["creditScore"])
        print(self.result["creditMatrix"])
        
        print(self.lblScore.text as? String)
    }
    
//
//
//    func setChartValues() {
//
//       // let values = [ChartDataEntry(x: 1, y: 850)]
//        let values = [ChartDataEntry(x: 650, y: 1000), ChartDataEntry(x: 651, y: 985), ChartDataEntry(x: 652, y: 990)]
//
//        print(values)
////        let balanceValues = [ChartDataEntry(x: 1, y: 1000)]
//
//        let set1 = LineChartDataSet(values: values, label: "DataSet 1")
//       // let set2 = LineChartDataSet(values: balanceValues, label: "DataSet 2")
//      //  let data = LineChartData(dataSets: [set1, set2])
//        let data = LineChartData(dataSet: set1)
//
//        self.lineChartView.data = data
//
//    }
    @IBAction func improveButton(_ sender: UIButton) {
        SwiftSpinner.show("Improving...")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // change 2 to desired number of seconds
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            // you need to cast this next line to the type of VC.
            let vc = storyboard.instantiateViewController(withIdentifier: "improveVC") as! ImproveVC
            vc.resultData = self.result
            SwiftSpinner.hide()
            
            self.navigationController?.pushViewController(vc, animated: true)
        
        }
        
    }
    
}

