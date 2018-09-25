//
//  FoodCellTableViewCell.swift
//  פירות אדר
//
//  Created by יובל נחום on 21.6.2018.
//  Copyright © 2018 יובל נחום. All rights reserved.
//

import UIKit

class FoodCellTableViewCell: UITableViewCell {
    
    var checked = false{
        didSet{
            if checked{
                //V
                btnSwitch.setTitle("✓", for: .normal)
                btnSwitch.setTitle("✓", for: .highlighted)
            }else{
                //not checked - no text
                btnSwitch.setTitle(" ", for: .normal)
                btnSwitch.setTitle(" ", for: .highlighted)
            }
        }
    }
    
    @IBAction func toggleCheck(_ sender: UIButton) {
        checked = !checked
    }
    
    @IBOutlet weak var btnSwitch: UIButton!
    @IBOutlet weak var friutlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnSwitch.setTitle(" ", for: .normal)
        // Initialization code
    }
 
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.checked = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
