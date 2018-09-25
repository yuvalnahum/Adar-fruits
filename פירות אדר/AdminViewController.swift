//
//  AdminViewController.swift
//  פירות אדר
//
//  Created by יובל נחום on 5.9.2018.
//  Copyright © 2018 יובל נחום. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBAction func back(_ sender: UIButton) {
        UserDefaults.standard.setValue("123", forKey: "email")
        performSegue(withIdentifier: "mainSegue", sender: nil)
    }
    
    var array = [AdminItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datafetch()
        
    }
    func datafetch (){
        array = [AdminItem]()
        let url = URL(string: "https://yuvalnahum.herokuapp.com/orders")!
        URLSession.shared.dataTask(with: url){
            (data, response, error) in
            if (error != nil) {
                print(error?.localizedDescription)
            }
            guard let data = data else{
                print("no data....")
                return
            }
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            guard let object = json as? [String: Any] else{
                print("no json....")
                return
            }
            let rows = object["rows"] as? [[String: Any]]
            for row in rows!{
                let email = row["email"] as! String
                let id = row["id"] as! Int
                let state = row["state"] as! String
                self.array.append(AdminItem(email: email, id: id, state: state))
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            }.resume()
    }

}

extension AdminViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "adminCell") as! AdminTableViewCell
        cell.emailLabel.text = array[indexPath.row].email
        cell.idLabel.text = String(array[indexPath.row].id)
        cell.stateLabel.text = array[indexPath.row].state
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat.init(200)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "ChangeState", message: nil, preferredStyle: .alert)
        alert.addTextField { (text) in
            text.placeholder = "state"
        }
        alert.addAction(UIAlertAction(title: "accept", style: .default, handler: { (a) in
            let textField = alert.textFields![0].text!
            let id = self.array[indexPath.row].id
            let st = "https://yuvalnahum.herokuapp.com/updateOrder?state=\(textField)&id=\(id)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let url = URL(string: st!)
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                if (error != nil) {
                    print(error?.localizedDescription)
                }
                guard let data = data else{
                    print("no data....")
                    return
                }
                self.datafetch()
            }).resume()
        }))
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { (a) in
            let id = self.array[indexPath.row].id
            let st = "https://yuvalnahum.herokuapp.com/deleteOrder?id=\(id)"
            let url = URL(string: st)
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                if (error != nil) {
                    print(error?.localizedDescription)
                }
                guard let data = data else{
                    print("no data....")
                    return
                }
                self.datafetch()
            })
            .resume()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}















