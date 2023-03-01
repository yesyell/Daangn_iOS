//
//  CustomTableViewCell2.swift
//  Table
//
//  Created by 김예린 on 2022/07/28.
//

import UIKit

class CustomTableViewCell2: UITableViewCell {

    @IBOutlet weak var personImg: UIImageView!
    @IBOutlet weak var lbpersonName: UILabel!
    @IBOutlet weak var lbcontent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
