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

class ImproveVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let spendingRates = ["Spending Rate","$100 per month","$200 per month","$300 per month","$400 per month","$500 per month" ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spendingRates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "improveCell", for: indexPath) as! ImproveCellVC

        
        cell.lblSpendingRate.text = spendingRates[indexPath.row]
        print(spendingRates[indexPath.row])
        cell.lblScoreImpact.text = "+5"

        return(cell)
        
    }
    
    
}
