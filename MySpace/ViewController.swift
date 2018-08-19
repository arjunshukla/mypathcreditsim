//
//  ViewController.swift
//  MySpace
//
//  Created by Veer Doshi on 8/18/18.
//  Copyright © 2018 Veer Doshi. All rights reserved.
//

import UIKit
import SwiftSpinner

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let spendingRates = ["$100 per month","$200 per month","$300 per month","$400 per month","$500 per month" ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(spendingRates.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell1")
        cell.textLabel?.text = spendingRates[indexPath.row]
        return(cell)
        
    }
    

    @IBOutlet weak var balanceTextKey: UITextField!
    @IBOutlet weak var creditTextField: UITextField!
    @IBOutlet weak var payHistorySC: UISegmentedControl!
    @IBOutlet weak var lineOfCreditSC: UISegmentedControl!
    @IBOutlet weak var sliderValue: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func creditSlider(_ sender: UISlider) {
        sliderValue.text = String(sender.value.rounded())
    }
    
    @IBAction func simulateButton(_ sender: UIButton) {
        SwiftSpinner.show("Loading")
        self.view.endEditing(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // change 2 to desired number of seconds
            SwiftSpinner.hide()
            self.performSegue(withIdentifier: "homeToResults", sender: self)
        }
        
        
    }
    
    @IBAction func onTap(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    
}

