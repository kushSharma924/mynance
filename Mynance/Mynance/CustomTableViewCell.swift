//
//  CustomTableViewCell.swift
//  Mynance
//
//  Created by Kush Sharma on 5/1/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var img: UIImageView!
    @IBOutlet var d: UILabel!
    @IBOutlet var money: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with transaction : Transaction) {
        d.text = transaction.desc
        money.text = "$" + String(format: "%.2f", transaction.cost)
        let imageName = transaction.type
        img.image = UIImage(named: imageName)
    }

}
