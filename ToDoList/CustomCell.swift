//
//  CustomCell.swift
//  ToDoList
//
//  Created by لمياء فالح الدوسري on 14/05/1443 AH.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var disc: UILabel!
    @IBOutlet weak var Tasktext: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
