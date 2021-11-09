//
//  ViewController.swift
//  CalcApp
//
//  Created by 美並　明伸 on 2021/11/08.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    var cost:Double = 0
    var addTaxCost:Double = 0
    var costsArray:[Double] = []
    var addTaxCostString:String = ""
    
    @IBOutlet weak var resultNum: UILabel!
    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var taxController: UISegmentedControl!
    @IBOutlet weak var costField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTableView.delegate = self
        itemTableView.dataSource = self
        
        costsArray.removeAll()
    }
    
    @IBAction func taxButton(_ sender: Any) {
        if taxController.selectedSegmentIndex == 0 {
            calc(tax: 1.1)
        } else {
            calc(tax: 1.08)
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        costsArray.append(contentsOf: [addTaxCost])
        print(costsArray)
        UserDefaults.standard.set(costsArray, forKey: "item")
        
        costField.text = ""
        resultNum.text = ""
        
        self.itemTableView.reloadData()
    }
    
    func calc(tax:Double) {
        cost = Double(costField.text!)!
        addTaxCost = cost * Double(tax)
        print(addTaxCost)
        
        addTaxCostString = String(format: "%.0f", addTaxCost)
        resultNum.text = addTaxCostString
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return costsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        cell.textLabel?.text = "\(costsArray[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            costsArray.remove(at: indexPath.row)
            
            UserDefaults.standard.set(costsArray, forKey: "item")
            
            itemTableView.reloadData()
        }
    }
    
}

