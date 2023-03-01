//
//  CategoryTableViewCell.swift
//  Table
//
//  Created by 김예린 on 2022/07/30.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categorySelect: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
