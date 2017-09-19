//
//  ViewController.swift
//  Shopping List Demo
//
//  Created by Mitchell Gant on 9/13/17.
//  Copyright © 2017 Mitchell Gant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var listItems: [(String, Bool)] = []

    @IBOutlet weak var listTBLV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        listTBLV.delegate = self
        listTBLV.dataSource = self
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listItem") as! ListItemCell
            cell.listItem.text = listItems[indexPath.row].0
        
        if listItems[indexPath.row].1 {
            cell.completedLabel.text = "✓"
        } else {
            cell.completedLabel.text = ""
        }
        cell.backgroundColor = .clear
        return cell
    }
    
    
    @IBAction func addItemBtnPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add an Item", message: "Type the item you want to add below.", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Apples, Oranges, etc."
        }
        let addItem = UIAlertAction(title: "Add", style: .default) { (action) in
            if let textField = alert.textFields?.first {
                if textField.text != "" {
                    self.listItems.append((textField.text!, false))
                }
            }
            self.listTBLV.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addAction(cancel)
        alert.addAction(addItem)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { (action, indexPath) in
            self.listItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
        let check = UITableViewRowAction(style: .normal, title: "Check") { (action, indexPath) in
            self.listItems[indexPath.row].1 = true
            self.listTBLV.reloadData()
            
        }
        
        delete.backgroundColor = .red
        check.backgroundColor = .green
        
        
        return [delete, check]
    }
    


}

