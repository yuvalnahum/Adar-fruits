//
//  Login.swift
//  פירות אדר
//
//  Created by יובל נחום on 18.6.2018.
//  Copyright © 2018 יובל נחום. All rights reserved.
//

import UIKit

class Login: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBAction func loginBtn(_ sender: UIButton) {
        guard let email = emailTF.text else{
            return
        }
        guard let password = passwordTF.text else{
            return
        }
        let url = URL(string: "https://yuvalnahum.herokuapp.com/login?email=\(email)")!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if (error != nil) {
                print(error?.localizedDescription)
            }
            guard let data = data else{
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    let row = json["rows"] as? [[String: Any]]
                    if((row?.count)! < 1){
//                        להוסיף אלרט של אימייל לא קיים......
                        return
                    }
                    let password1 = row![0]["password"] as! String
                    if(password == password1){
                        DispatchQueue.main.async {
                            UserDefaults.standard.set(email, forKey: "email")
                            self.performSegue(withIdentifier: "login", sender: nil)
                        }
                    }else{
                        //                        להוסיף אלרט בשגיאה של הסיסמה..... {הסיסמה לא נכונה}
                    }
                }
            } catch let parseError {
                
            }
        }.resume()
    }
    
}
