//工廠會用到的方法
import UIKit
//加法
class Add : Calculator {
    override func count() {
        nowAnswer()
        label.text = "+"
        operation = "add"
        performingMath = true
        beforeNumber = screenNumber
    }
}

//減法
class Substract : Calculator {
    override func count() {
        nowAnswer()
        label.text = "-"
        operation = "substract"
        performingMath = true
        beforeNumber = screenNumber
    }
}

//乘法
class Multiply : Calculator {
    override func count() {
        nowAnswer()
        label.text = "x"
        operation = "multiply"
        performingMath = true
        beforeNumber = screenNumber
    }
}

//除法
class Divide : Calculator {
    override func count() {
        nowAnswer()
        label.text = "/"
        operation = "divide"
        performingMath = true
        beforeNumber = screenNumber
    }
}

//清除
class Clear : Calculator {
    override func count() {
        label.text = "0"
        screenNumber = 0
        beforeNumber = 0
        performingMath = false
        operation = "none"
        startNew = true
    }
}

//點按數字
class Numbers: Calculator {
    var sender: UIButton
    init(label:UILabel, sender: UIButton) {
        self.sender = sender
        super.init(label: label)
    }
    override func count() {
        let inputNumber = sender.tag - 1
        if label.text != nil{
            if startNew == true{
                label.text = "\(inputNumber)"
                startNew = false
            }else{
                if label.text == "0" || label.text == "+" || label.text == "-" || label.text == "x" || label.text == "/" {
                    label.text = "\(inputNumber)"
                }else{
                    label.text = label.text! + "\(inputNumber)"
                }
            }
            screenNumber = Double(label.text!) ?? 0
        }
    }
}

//計算結果
class GiveMeAnswer: Calculator{
    override func count(){
        if performingMath == true{
            if operation == "add"{
                screenNumber = beforeNumber + screenNumber
                oKNumberString(from: screenNumber)
            }else if operation == "substract"{
                screenNumber = beforeNumber - screenNumber
                oKNumberString(from: screenNumber)
            }else if operation == "multiply"{
                screenNumber = beforeNumber * screenNumber
                oKNumberString(from: screenNumber)
            }else if operation == "divide"{
                if screenNumber == 0{
                    let alert = UIAlertController(title: "Error", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                }else{
                    screenNumber = beforeNumber / screenNumber
                    oKNumberString(from: screenNumber)
                }
            }else if operation == "none"{
                label.text = "0"
            }
            performingMath = false
            startNew = true
        }
    }
}
