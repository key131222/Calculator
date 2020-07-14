//工廠方法
import UIKit

//計算機通用參數
//目前點選
var screenNumber:Double = 0
//上一個點選
var beforeNumber:Double = 0
//執行計算確認
var performingMath = false
//算法
var operation = "none"
//重新確認
var startNew = true


//型別協議規定：抓方法用
protocol Protocol {
    var label: UILabel { get }
    func count()
    func playAll()
}
//存放會使用到的方法和init參數
class Calculator: Protocol {
    
    var label: UILabel
    init(label:UILabel){
        self.label = label
    }
    //執行計算(方法一)
    func count() {
    }
    //全部計算執行(方法二)
    func playAll() {
        count()
    }
    //調整數字顯示
    func oKNumberString(from number:Double){
        var okText:String
        if floor(number) == number{
            okText = "\(Int(number))"
        }else{
            okText = "\(number)"
        }
        if okText.count >= 9{
            okText = String(okText.prefix(9))
        }
        label.text = okText
    }
    //目前數字
    func nowAnswer() {
        if performingMath == true{
            if operation == "add"{
                screenNumber = beforeNumber + screenNumber
            }else if operation == "substract"{
                screenNumber = beforeNumber - screenNumber
            }else if operation == "multiply"{
                screenNumber = beforeNumber * screenNumber
            }else if operation == "divide"{
                if screenNumber == 0{
                    let alert = UIAlertController(title: "Error", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    
                    let present = UIViewController()
                    present.present(alert, animated: true, completion: nil)
                    
                }else{
                    screenNumber = beforeNumber / screenNumber
                }
            }else if operation == "none"{
                label.text = "0"
            }
        }
    }
}


//列舉工廠裡的方法
enum Calculators {
    case add
    case substract
    case multiply
    case divide
    case clear
    case numbers
    case giveMeAnswer
}
//可依照選取而生產的工廠
class CalculatorsFactory {
    
    let label: UILabel
    let sender: UIButton
    init(label: UILabel, sender: UIButton) {
        self.label = label
        self.sender = sender
    }
    
    func create(_ calculators: Calculators) -> Protocol {
        
        switch calculators {
            
        case .add:
            
            let add = Add(label: label)
            
            return add
            
        case .substract:
            
            let substract = Substract(label: label)
            return substract
            
        case .multiply:
            
            let multiply = Multiply(label: label)
            return multiply
            
        case .divide:
            
            let divide = Divide(label: label)
            return divide
            
        case .clear:
            
            let clear = Clear(label: label)
            return clear
            
        case .giveMeAnswer:
            
            let giveMeAnswer = GiveMeAnswer(label: label)
            return giveMeAnswer
            
        case .numbers:
            
            let numbers = Numbers(label: label, sender: sender)
            return numbers
        }
    }
}


//實際執行生產
//方法一
func createCalculator(_ calculators: Calculators, on label: UILabel, in sender: UIButton) {
    let shapeFactory = CalculatorsFactory(label: label, sender: sender)
    shapeFactory.create(calculators).count()
    
}
//方法二
func getCalculator(_ calculators: Calculators, on label: UILabel, in sender: UIButton) -> Protocol {
    let calculatorsFactory = CalculatorsFactory(label: label, sender: sender)
    return calculatorsFactory.create(calculators)
}






