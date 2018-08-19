//
//  ImproveVC.swift
//  MySpace
//
//  Created by Mithil Patil on 8/18/18.
//  Copyright © 2018 Veer Doshi. All rights reserved.
//

import Foundation
import UIKit
import SwiftSpinner
import SwiftyJSON

class ImproveVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var resultData: JSON = []

    let spendingRates = ["Payment Options","$100/month","$200/month","$300/month","$400/month","$500/month", "$ Balance per month" ]
    let secondColumn = ["3 Months", "-4", "+20", "+30","+40", "+50", "+100"]
    let thirdColumn = ["6 Months", "+5", "+30", "+50","+65", "+85", "+110"]
    let fourthColumn = ["1 Year", "+15", "+50", "+70","+95", "+105", "180"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spendingRates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "improveCell", for: indexPath) as! ImproveCellVC

        
        cell.lblSpendingRate.text = spendingRates[indexPath.row]
        cell.lblScoreImpact.text = secondColumn[indexPath.row]
        cell.lblThirdColumn.text = thirdColumn[indexPath.row]
        cell.lblFourthColumn.text = fourthColumn[indexPath.row]
        return(cell)
        
    }
    
    
}
