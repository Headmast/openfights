//
//  DepoCell.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 17.09.17.
//  Copyright © 2017 Kirill Klebanov. All rights reserved.
//

import UIKit

class DepoCell: UITableViewCell {

    @IBOutlet weak var stitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func fillCell(title: String) {
        stitleLabel.text = title
    }
}
