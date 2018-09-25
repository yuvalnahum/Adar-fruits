//
//  MyOrderViewController.swift
//  פירות אדר
//
//  Created by יובל נחום on 30.8.2018.
//  Copyright © 2018 יובל נחום. All rights reserved.
//

import UIKit

class MyOrderViewController: UIViewController {
    @IBOutlet weak var TableView: UITableView!
    var array = [Order]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var email = UserDefaults.standard.string(forKey: "email")!
        if(email == "123"){
            UserDefaults.standard.setValue("adar@adar.com", forKey: "email")
           email = "adar@adar.com"
        }
        let e = UserDefaults.standard.string(forKey: "email")!
        print(e)
        
        let url = URL(string: "https://yuvalnahum.herokuapp.com/userOrders?email=\(email)")!
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
                let id = row["id"] as! Int
                let state = row["state"] as! String
                self.array.append(Order(state: state, id: id))
            }
            DispatchQueue.main.async {
                self.TableView.reloadData()
            }
        }
        .resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

extension MyOrderViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "order") as! myOrderTableViewCell
        cell.state.text = array[indexPath.row].state
        return cell
    }
    
    
}



























