//
//  Register.swift
//  פירות אדר
//
//  Created by יובל נחום on 18.6.2018.
//  Copyright © 2018 יובל נחום. All rights reserved.
//

import UIKit

class Register: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repasswordTextField: UITextField!
    @IBAction func registerBtn(_ sender: UIButton) {
        
        guard emailTextField.text != "" else{
            let alert = UIAlertController(title: "שגיאה", message: "אימייל או סיסמה לא נכונים...", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "לחצ/י", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        guard passwordTextField.text != nil else{
            let alert = UIAlertController(title: "שגיאה", message: "אימייל או סיסמה לא נכונים...", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "לחצ/י", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
            guard repasswordTextField.text != nil else{
            let alert = UIAlertController(title: "שגיאה", message: "אימייל או סיסמה לא נכונים...", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "לחצ/י", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let url = URL(string: "https://yuvalnahum.herokuapp.com/userCheck?email=\(email)")
        URLSession.shared.dataTask(with: url!){
            (data, response, error) in
            if(error != nil){
                print(error?.localizedDescription)
            }else{
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                guard let object = json as? [String: Any] else{
                    return
                }
                let rowcount = object["rowCount"] as! Int
                if(rowcount == 0){
                    let url = URL(string: "https://yuvalnahum.herokuapp.com/addUser?email=\(email)&password=\(password)")!
                    URLSession.shared.dataTask(with: url) { (data, response, error) in
                        if (error != nil) {
                            print(error?.localizedDescription)
                        }else{
                            DispatchQueue.main.async {
                                self.performSegue(withIdentifier: "registeID", sender: nil)
                            }
                        }
                        
                        }.resume()
                }else{
                    // add alert that email exist alreday.....
                }

            }
        }.resume()
        
    }
    
    override func viewDidLoad() {
        //code
    }
    
    
    
    
    
    
}
