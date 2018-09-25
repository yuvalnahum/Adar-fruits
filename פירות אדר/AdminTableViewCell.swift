//
//  AdminTableViewCell.swift
//  פירות אדר
//
//  Created by יובל נחום on 5.9.2018.
//  Copyright © 2018 יובל נחום. All rights reserved.
//

import UIKit

class AdminTableViewCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
