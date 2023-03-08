//
//  ItemCell.swift
//  CoordinatorPattern
//
//  Created by Anand Upadhyay on 07/03/23.
//  Copyright © 2023 Anand. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var lblItemName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
