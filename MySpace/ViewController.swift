//
//  ViewController.swift
//  MySpace
//
//  Created by Veer Doshi on 8/18/18.
//  Copyright © 2018 Veer Doshi. All rights reserved.
//

import UIKit
import SwiftSpinner
import Alamofire
import SwiftyJSON

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
        sliderValue.text = String(Int(sender.value.rounded()))
    }
    
    @IBAction func simulateButton(_ sender: UIButton) {
        print("Balance: \(balanceTextKey.text as! String)")
        print("Line of Credit: \(creditTextField.text as! String)")
        print("Pay History: \(payHistorySC.selectedSegmentIndex)")
        print("New Line of Credit: \(lineOfCreditSC.selectedSegmentIndex)")
        print("Credit Mix: \(sliderValue.text as! String)")
    SwiftSpinner.show("Loading")
        self.view.endEditing(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // change 2 to desired number of seconds
        self.getcreditScore()
        

        }
        
        
    }
    
    // With Alamofire
    func getcreditScore() {
         
        var url = "http://tatucool123.pythonanywhere.com/calculateCredit?balance=\(balanceTextKey.text as! String)&loc=\(creditTextField.text as! String)&creditMix=\(sliderValue.text as! String)&newCredit=\(lineOfCreditSC.selectedSegmentIndex)&creditHistoryYears=1&paymentHistory=\(payHistorySC.selectedSegmentIndex)"
        print(url)
        
        Alamofire.request(url, method: .get, parameters: ["include_docs": "true"]).validate().responseJSON {
            response in
            if response.result.isSuccess {
                
                var retrievedJSON : JSON = JSON(response.result.value!)
                SwiftSpinner.hide()
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                // you need to cast this next line to the type of VC.
                let vc = storyboard.instantiateViewController(withIdentifier: "resultVC") as! ResultsScreenViewController
                vc.result = retrievedJSON
                
                self.navigationController?.pushViewController(vc, animated: true)
                
//                self.performSegue(withIdentifier: "homeToResults", sender: self)
                
                print(retrievedJSON)
                
            }
            else {
                print("Error \(String(describing: response.result.error))")
                SwiftSpinner.hide()
            }
        }
        
        
        
        
//        Alamofire.request(url,
//                          method: .get,
//                          parameters: ["include_docs": "true"])
//            .validate()
//            .responseJSON { response in
//                guard response.result.isSuccess else {
//                    print("Error while fetching remote rooms: \(describing: response.result.error)")
//                    return
//                }
//
//                guard let value = response.result.value as? [String: Any],
//                    let rows = value["rows"] as? [[String: Any]] else {
//                        print("Malformed data received from fetchAllRooms service")
//                        return
//                }
//
////                let rooms = rows.flatMap { roomDict in return RemoteRoom(jsonData: roomDict) }
//        }
    }
    
    @IBAction func onTap(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    
}

