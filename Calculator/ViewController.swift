//
//  ViewController.swift
//  Calculator
//
//  Created by yothin junlatat on 20/3/2561 BE.
//  Copyright © 2561 yothin junlatat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var formular: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func calculate(expression: String) -> String {
        let mathExpression = NSExpression(format: expression)
        if let mathValue = mathExpression.expressionValue(with: nil, context: nil) as? NSNumber {
            if String.init(describing: mathValue.decimalValue) == "NaN" {
                return "Infinity"
            }else {
                return String.init(describing: mathValue.decimalValue)
            }
        }else {
            return "nothing"
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkResult(_ sender: Any) {
        result.text = self.calculate(expression: formular.text!)
    }
}
//
//extension ViewController: UITextFieldDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        result.text = self.calculate(expression: textField.text!)
//        return true
//    }
//}




