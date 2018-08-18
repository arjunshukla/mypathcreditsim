//
//  ViewController.swift
//  MySpace
//
//  Created by Veer Doshi on 8/18/18.
//  Copyright © 2018 Veer Doshi. All rights reserved.
//

import UIKit
import SwiftSpinner

class ViewController: UIViewController {

    @IBOutlet weak var balanceTextKey: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func simulateButton(_ sender: UIButton) {
        SwiftSpinner.show("Loading")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // change 2 to desired number of seconds
            SwiftSpinner.hide()
            self.performSegue(withIdentifier: "homeToResults", sender: self)
        }
        
        
    }
    
}

