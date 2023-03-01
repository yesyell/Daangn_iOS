//
//  CustomTableViewCell4.swift
//  Table
//
//  Created by 김예린 on 2022/07/29.
//

import UIKit

class CustomTableViewCell4: UITableViewCell {

    @IBOutlet weak var lbCategory: UILabel!
    @IBOutlet weak var lbQuestion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
