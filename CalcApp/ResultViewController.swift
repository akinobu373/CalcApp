//
//  ResultViewController.swift
//  CalcApp
//
//  Created by 美並　明伸 on 2021/11/09.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var totalView: UILabel!
    var resultArray:[Double] = []
    var sum:Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "item") != nil {
            resultArray = UserDefaults.standard.object(forKey: "item") as! [Double]}
        else{resultArray=[0.0]}
        print(resultArray)
    sum = resultArray.reduce(0) { (num1:Double, num2:Double) -> Double in
        return num1 + num2
    }
    
    totalView.text = String(format: "%.0f", sum)
    
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

}
