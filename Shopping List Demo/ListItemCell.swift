//
//  ListItemCell.swift
//  Shopping List Demo
//
//  Created by Mitchell Gant on 9/13/17.
//  Copyright © 2017 Mitchell Gant. All rights reserved.
//

import UIKit

class ListItemCell: UITableViewCell {

    @IBOutlet weak var listItem: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    
    func decorate(listItem: String, checked: Bool) {
        self.listItem.text = listItem
        
        if checked {
            self.completedLabel.text = "✓"
        } else {
            self.completedLabel.text = ""
        }
        self.backgroundColor = .clear
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
