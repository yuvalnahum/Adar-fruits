//
//  OrdersTableViewController.swift
//  פירות אדר
//
//  Created by יובל נחום on 21.6.2018.
//  Copyright © 2018 יובל נחום. All rights reserved.
//

import UIKit

class OrdersTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var myTableView: UITableView!
    var email = String()
    @IBOutlet weak var numPhone: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var order45outlet: UIButton!
    @IBOutlet weak var order40outlet: UIButton!
    @IBOutlet weak var order35outlet: UIButton!
    @IBOutlet weak var order30outlet: UIButton!
    @IBAction func order30(_ sender: UIButton) {
       
        var string = ""
        if checker(){
            let address = addressTF.text!
            let num = numPhone.text!
            for fruit in fruitArray{
                string.append(fruit.name + "_")
            }
            string.removeLast()
            let url = URL(string: "https://yuvalnahum.herokuapp.com/addOrders?email=\(email)&address=\(address)&telephone=\(num)&fruits=\(string)&size=\("30")".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            print(url)
            URLSession.shared.dataTask(with: url!){
                (data, response, error) in
                if (error != nil) {
                    print(error?.localizedDescription)
                }
                guard let data = data else{
                    print("no data....")
                    return
                }
                print(data)
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                guard let object = json as? [String: Any] else{
                    print("no json....")
                    return
                }
            }.resume()
        }
    }
    @IBAction func order35(_ sender: UIButton) {
        
        var string = ""
        if checker(){
            let address = addressTF.text!
            let num = numPhone.text!
            for fruit in fruitArray{
                string.append(fruit.name + "_")
            }
            string.removeLast()
            let url = URL(string: "https://yuvalnahum.herokuapp.com/addOrders?email=\(email)&address=\(address)&telephone=\(num)&fruits=\(string)&size=\("35")".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            URLSession.shared.dataTask(with: url!){
                (data, response, error) in
                if (error != nil) {
                    print(error?.localizedDescription)
                }
                guard let data = data else{
                    return
                }
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                guard let object = json as? [String: Any]else{
                    return
                }
            }.resume()
        }
    }
    @IBAction func order40(_ sender: UIButton) {
        
        var string = ""
        if checker(){
            let address = addressTF.text!
            let num = numPhone.text!
            for fruit in fruitArray{
                string.append(fruit.name + "_")
            }
            string.removeLast()
            let url = URL(string: "https://yuvalnahum.herokuapp.com/addOrders?email=\(email)&address=\(address)&telephone=\(num)&fruits=\(string)&size=\("40")".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            URLSession.shared.dataTask(with: url!){
                (data, response, error) in
                if (error != nil) {
                    print(error?.localizedDescription)
                }
                guard let data = data else{
                    return
                }
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                guard let object = json as? [String: Any]else{
                    return
                }
            }.resume()
        }
    }
    @IBAction func order45(_ sender: UIButton) {
        
        var string = ""
        if checker(){
            let address = addressTF.text!
            let num = numPhone.text!
            for fruit in fruitArray{
                string.append(fruit.name + "_")
            }
            string.removeLast()
            let url = URL(string: "https://yuvalnahum.herokuapp.com/addOrders?email=\(email)&address=\(address)&telephone=\(num)&fruits=\(string)&size=\("45")".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            URLSession.shared.dataTask(with: url!){
                (data, response, error) in
                if (error != nil) {
                    print(error?.localizedDescription)
                }
                guard let data = data else{
                    return
                }
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                guard let object = json as? [String: Any]else{
                    return
                }
            }.resume()
        }
    }
    func checker ()->Bool{
        guard let num = numPhone.text else{
            return false
        }
        guard let address = addressTF.text else{
            return false
        }
        if(fruitArray.isEmpty){
            return false
        }
        return true
    }
    
    
    //MARK: Sections:
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    let sections = ["פירות בעונת קיץ", "פירות בעונת חורף"]
    
    var items:[[Fruit]] = {
        var winter =  ["אננס", "תפוח" ,"אפרסמון" ,"פסיפלורה", "מלון", "תותים", "קלמנטינה" ,"תפוז רגיל" ,"תפוז דם", "רימון", "קיווי", "פומלה" ,"אשכולית אדומה"]
        
        var summer = ["אבטיח", "מלון", "אננס", "ענבים שחורים","ענבים ירוקים" , "ליצ׳י" , "מנגו", "פסיפלורה" ,"קרמבולה", "דודבנים", "קובו", "פיטאייה", "משמש", "שסק", "תפוח", "תמרים", "אפרסק", "שזיף"]
        
        
        
        
        let summerFruit = summer.map({ (s) -> Fruit in
            return Fruit(name: s, checked: false)
        })
        
        let winterFruit = winter.map({ (s) -> Fruit in
            return Fruit(name: s, checked: false)
        })
        
        return [summerFruit, winterFruit]
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email = UserDefaults.standard.string(forKey: "email")!
        myTableView.delegate = self
        myTableView.dataSource = self
        
        order30outlet.applyDesignBtn()
        order35outlet.applyDesignBtn()
        order40outlet.applyDesignBtn()
        order45outlet.applyDesignBtn()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FoodCellTableViewCell
        cell.selectionStyle = .none
        
        
        let fruit  = self.items[indexPath.section][indexPath.row]
        //both text and checked:
        cell.friutlabel.text = fruit.name
        cell.checked = fruit.checked
        //cell.accessoryType =  fruit.checked ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if section == 0{
            view.tintColor = UIColor.red
        }else{
            view.tintColor = UIColor.blue
        }

        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.textAlignment = .right
    }

    
    var fruitArray = [Fruit]()
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FoodCellTableViewCell
        
        cell.checked = !cell.checked
        if(cell.checked){
            fruitArray.append(items[indexPath.section][indexPath.row])
        }else{
            if(fruitArray.contains(items[indexPath.section][indexPath.row])){
                fruitArray.remove(at: fruitArray.index(of: items[indexPath.section][indexPath.row])!)
            }
        }
        //save the fruit to the array
        items[indexPath.section][indexPath.row].checked = cell.checked
    }
    
    
    
   
}


extension UIButton{
    func applyDesignBtn(){
        self.layer.cornerRadius = self.frame.height / 2
        //self.layer.shadowColor = UIColor.darkGray.cgColor
        //self.layer.shadowRadius = 4
        //self.layer.shadowOpacity = 10
        //self.layer.shadowOffset = CGSize(width: 0, height: 0 )
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 7
        self.layer.cornerRadius = 7
        self.layer.cornerRadius = 7
    }
}


