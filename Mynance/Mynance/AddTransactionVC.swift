//
//  AddTransactionVC.swift
//  Mynance
//
//  Created by Kush Sharma on 4/29/24.
//

import UIKit

class AddTransactionVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var descriptionField: UITextField!
    @IBOutlet var costField: UITextField!
    var cost : Double = 0.0
    var desc : String = ""
    var choices : [String] = ["Income", "Groceries", "Utilities"]
    var curRow : String = "Income"
    var cancel : Bool = false
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        choices.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choices[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        curRow = choices[row]
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        cancel = true
    }
    
    @IBOutlet var pickerView: UIPickerView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard cancel == false else {return}
        if let s = segue.destination as? ViewController {
            desc = descriptionField.text ?? "no val"
            if let d = Double(costField.text!) {
                cost = d
            }
            s.choice = curRow
            s.cost = cost
            s.desc = desc
            s.transactions.append(Transaction(cost: cost, type: curRow, desc: self.desc))

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
    }
}
