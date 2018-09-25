//
//  CustomSwitchViewController.swift
//  פירות אדר
//
//  Created by יובל נחום on 25.6.2018.
//  Copyright © 2018 יובל נחום. All rights reserved.
//

import UIKit

class CustomSwitchViewController: UIViewController {

    var checked = false
    @IBAction func `switch`(_ sender: UIButton) {
        switchButtonText(button: sender)
        checked = !checked
        
        print(checked)
    }
    
    func switchButtonText(button: UIButton){
        if button.title(for: .normal) == "_"{
            button.setTitle("✓", for: .normal)
            button.setTitle("_", for: .highlighted)
        }else{
            button.setTitle("_", for: .normal)
            button.setTitle("✓", for: .highlighted)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
