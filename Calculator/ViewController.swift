//
//  ViewController.swift
//  Calculator
//
//  Created by yothin junlatat on 20/3/2561 BE.
//  Copyright © 2561 yothin junlatat. All rights reserved.
//

import UIKit

extension Array {
    func indexes<T: Equatable>(ofItemsEqualTo item: T) -> [Int]?  {
        var result: [Int] = []
        for (n, elem) in self.enumerated() {
            if elem as? T == item {
                result.append(n)
            }
        }
        return result.isEmpty ? nil : result
    }
}

extension String{
    func toDouble() -> Double {
        if let convert = Double(self) {
            return convert
        }else {
            return 0.0
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var formular: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        result.accessibilityIdentifier = "result"
        formular.accessibilityIdentifier = "formular"
    }

    var operationSign = ["/","*","+","-"]

    
    func matchesForRegexInText(text: String!) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: "\\((.*?)\\)", options: [])
            let nsString = text as NSString
            
            let results = regex.matches(in: text, options: [], range: NSMakeRange(0, nsString.length))
            return results.map { nsString.substring(with: $0.range)}
            
        } catch let error as NSError {
            
            print("invalid regex: \(error.localizedDescription)")
            return []
        }}
    
    
    func splite(text: String) -> ([String], [Double]) {
        var offset = 0
        var op: [String] = []
        var opStack: Array<Double> = Array<Double>()
        for index in text.enumerated() {
            if operationSign.contains(String(index.element)) || index.offset == text.count-1 {
                let idStart = text.index(text.startIndex, offsetBy: offset)
                var idEnd = text.index(text.startIndex, offsetBy: index.offset-1)
                if index.offset != text.count-1 {
                    op.append(String(index.element))
                }else {
                    idEnd = text.index(text.startIndex, offsetBy: text.count-1)
                }
                opStack.append(String(text[idStart...idEnd]).toDouble())
                offset = index.offset+1
            }
        }
        
        return (op,opStack)
    }
    
    func performCal(first: Double, second: Double, operation: String) -> Double {
        switch operation {
        case "*":
            return first * second
        case "/" :
            return first / second
        case "+" :
            return first + second
        case "-" :
            return first - second
        default :
            return 0.0
        }
    }
    
    
    func calculate(ops:[String], opStack:[Double]) -> Double {
        var opsCal = ops
        var opStackCal = opStack
        for opsign in operationSign {
            var indexOpsCal = opsCal.indexes(ofItemsEqualTo: opsign) ?? []
            for idPioritySign  in indexOpsCal {
                if let index = opsCal.indexes(ofItemsEqualTo: opsign)?.first {
                     let sum = performCal(first: opStackCal[index], second: opStackCal[index + 1], operation: opsCal[index])
                    opStackCal.remove(at: index)
                    opStackCal[index] = sum
                    opsCal.remove(at: index)
                    indexOpsCal.removeFirst()
                }
            }
            
        }
        return opStackCal.reduce(0, +)
    }
    
    func actionCal(text: String) -> String {
        if text == "" { return "Please input some formular below!" }
        
        let testdata = text
        var test = testdata.replacingOccurrences(of: " ", with: "")
        for bracket in matchesForRegexInText(text: testdata) {
            var bracketCustom = bracket
            bracketCustom = bracketCustom.replacingOccurrences(of: "(", with: "")
            bracketCustom = bracketCustom.replacingOccurrences(of: ")", with: "")
            bracketCustom = bracketCustom.replacingOccurrences(of: " ", with: "")
            let (op,opStack) = splite(text: bracketCustom)
            test = test.replacingOccurrences(of: bracket.replacingOccurrences(of: " ", with: ""), with: String(performCal(first: opStack[0], second: opStack[1], operation: op.first!)))
        }
        
        let (op,opStack) = splite(text: test)
        return "\(calculate(ops: op, opStack: opStack))"
    }
    
    @IBAction func checkResult(_ sender: Any) {
        result.text = actionCal(text: formular.text ?? "")
    }
    

    
    
}

