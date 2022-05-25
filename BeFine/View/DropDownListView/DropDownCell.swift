//
//  MyDropDownCell.swift
//  BeFine
//
//  Created by shahadmufleh on 13/03/2022.
//

import UIKit
import DropDown
class MyDropDownCell: DropDownCell {
    @IBOutlet var myImageView : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        myImageView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
