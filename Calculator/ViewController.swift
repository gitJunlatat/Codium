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
        if let mathValue =  mathExpression.toFloatingPoint().expressionValue(with: nil, context: nil) as? NSNumber {
            if String.init(describing: mathValue.decimalValue) == "NaN" {
                return "Infinity"
            }else {
                return String.init(describing: mathValue.decimalValue)
            }
        }else {
            return "Hey what happen???"
        }

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkResult(_ sender: Any) {
        if formular.text?.count ?? 0 < 3 {
            result.text = "Hey what happen???"
            return
        }
        result.text = self.calculate(expression: formular.text!)
    }
}

