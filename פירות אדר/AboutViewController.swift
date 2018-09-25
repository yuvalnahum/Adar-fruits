//
//  AboutViewController.swift
//  פירות אדר
//
//  Created by יובל נחום on 5.9.2018.
//  Copyright © 2018 יובל נחום. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    var email = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        email = UserDefaults.standard.string(forKey: "email")!
        if(email == "adar@adar.com"){
            performSegue(withIdentifier: "adminSegue", sender: nil)
        }
    }
}
