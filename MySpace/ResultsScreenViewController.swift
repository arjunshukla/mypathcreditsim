//
//  ResultsScreenViewController.swift
//  MySpace
//
//  Created by Veer Doshi on 8/18/18.
//  Copyright © 2018 Veer Doshi. All rights reserved.
//

import UIKit
import Charts

class ResultsScreenViewController: UIViewController {

    @IBOutlet weak var lineChartView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setChartValues()
    }
    
    func setChartValues() {
        
       // let values = [ChartDataEntry(x: 1, y: 850)]
        let values = [ChartDataEntry(x: 650, y: 1000), ChartDataEntry(x: 651, y: 985), ChartDataEntry(x: 652, y: 990)]
        
        print(values)
//        let balanceValues = [ChartDataEntry(x: 1, y: 1000)]

        let set1 = LineChartDataSet(values: values, label: "DataSet 1")
       // let set2 = LineChartDataSet(values: balanceValues, label: "DataSet 2")
      //  let data = LineChartData(dataSets: [set1, set2])
        let data = LineChartData(dataSet: set1)
        
        self.lineChartView.data = data
        
    }
    
}

