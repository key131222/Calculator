//計算機：呼叫工廠裡的方法
import Foundation
import UIKit

class ViewController: UIViewController {
    //正常顯示Status
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @IBOutlet weak var label: UILabel!
    
    //呼叫工廠方法：方法一
    @IBAction func numbers(_ sender: UIButton) {
        createCalculator(.numbers,on: label, in: sender)
    }
    
    @IBAction func clear(_ sender: UIButton) {
        createCalculator(.clear,on: label, in: sender)
    }
    
    @IBAction func add(_ sender: UIButton) {
        createCalculator(.add, on: label, in: sender)
    }
    
    @IBAction func substract(_ sender: UIButton) {
        createCalculator(.substract, on: label, in: sender)
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        createCalculator(.multiply, on: label, in: sender)
    }
    //呼叫工廠方法：方法二
    @IBAction func divide(_ sender: UIButton) {
        let divide = getCalculator(.divide, on: label, in: sender)
        divide.playAll()
    }
    
    @IBAction func giveMeAnswer(_ sender: UIButton) {
        let giveMeAnswer = getCalculator(.giveMeAnswer, on: label, in: sender)
        giveMeAnswer.playAll()
    }
}





