//
//  ViewController.swift
//  Mynance
//
//  Created by Kush Sharma on 4/23/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    @IBOutlet var balanceLabel: UILabel!
    var balance : Double {
        var ans = 0.0
        for transaction in transactions {
            ans += transaction.cost
        }
        return ans
    }
    @IBOutlet var tv: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        let transaction = transactions[indexPath.row]
        cell.update(with: transaction)
        cell.showsReorderControl = true
        return cell
    }
    
    var choice : String = ""
    var desc : String = ""
    var cost : Double = 0.0
    var transactions : [Transaction] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tv.dataSource = self
        tv.delegate = self
        
    }

    @IBAction func clicked(_ sender: Any) {
        performSegue(withIdentifier: "a", sender: nil)
    }
    
    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {
        tv.reloadData()
        balanceLabel.text = "$" + String(format: "%.2f", balance)
    }
}

