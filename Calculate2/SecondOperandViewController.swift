
import UIKit
import Expression

class SecondOperandViewController: UIViewController {

    var formulaLabel: UILabel!
    var formula = ""
    var zeroButton = CalculateNumberButton(text: "0", color: UIColor.blue)
    var oneButton = UIButton.spawnCalculateNumberUIButton(text: "1", origin: CGPoint(x: 30, y: 200))
    var twoButton = CalculateNumberButton(frame: CGRect(x: 100, y: 300, width: 60, height: 60), text: "2", color: .blue)
    var threeButton = CalculateNumberButton(text: "3", color: UIColor.blue)
    var fourButton = CalculateNumberButton(text: "4", color: UIColor.blue)
    var fiveButton = CalculateNumberButton(text: "5", color: UIColor.blue)
    var sixButton = CalculateNumberButton(text: "6", color: UIColor.blue)
    var sevenButton = CalculateNumberButton(text: "7", color: UIColor.blue)
    var eightButton = CalculateNumberButton(text: "8", color: UIColor.blue)
    var nineButton = CalculateNumberButton(text: "9", color: UIColor.blue)
    var clearButton = CalculateNumberButton(text: "C", color: UIColor.blue)
    var calButton = CalculateNumberButton(text: "計算", color: UIColor.blue)
    var buttonArray: [UIButton] = []
    
    init(formula: String) {
        super.init(nibName: nil, bundle: nil)
        self.formula = formula
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationItem.title = "計算"
        // self.navigationController?.navigationBar.tintColor = UIColor.purple
        // self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.prefersLargeTitles = true
        formulaLabel = UILabel(frame: CGRect(x: 0, y: 100 + (self.navigationController?.navigationBar.frame.height)!, width: screenSize.width, height: 50))
        formulaLabel.text = formula
        formulaLabel.font = UIFont.systemFont(ofSize: 30)
        formulaLabel.layer.borderWidth = 2
        formulaLabel.layer.borderColor = UIColor.white.cgColor
        formulaLabel.backgroundColor = UIColor.gray
        formulaLabel.textAlignment = NSTextAlignment.center
        formulaLabel.adjustsFontSizeToFitWidth = true
        
        buttonArray = [oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton, zeroButton, clearButton, calButton]
        
        for button in buttonArray {
            button.addTarget(self, action: #selector(self.tappedNumberButton(_:)), for: UIControl.Event.touchDown)
        }
        view.backgroundColor = UIColor.darkGray
        
        var widthArray: [CGFloat] = []
        var widthArrayNumber: CGFloat = 0.0
        var heightArray: [CGFloat] = []
        var heightArrayNumber:CGFloat = self.formulaLabel.frame.maxY
        for _ in 0..<3 {
            widthArrayNumber = widthArrayNumber + (screenSize.width / 4.0)
            widthArray.append(widthArrayNumber)
        }
        for _ in 0..<4 {
            heightArrayNumber = heightArrayNumber + ((screenSize.height - self.formulaLabel.frame.maxY) / 6.0)
            heightArray.append(heightArrayNumber)
        }
        
        var num = 0
        for i in 0..<heightArray.count {
            for j in 0..<widthArray.count {
                buttonArray[num].center = CGPoint(x: widthArray[j], y: heightArray[i])
                num += 1
            }
        }
        buttonArray[9].center = CGPoint(x: widthArray[0], y: heightArray[3])
        

        view.addSubview(formulaLabel)
        for button in buttonArray {
            view.addSubview(button)
        }

    }
    
    @objc func tappedNumberButton (_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "1":
            self.formulaLabel.text! += "1"
        case "2":
            self.formulaLabel.text! += "2"
        case "3":
            self.formulaLabel.text! += "3"
        case "4":
            self.formulaLabel.text! += "4"
        case "5":
            self.formulaLabel.text! += "5"
        case "6":
            self.formulaLabel.text! += "6"
        case "7":
            self.formulaLabel.text! += "7"
        case "8":
            self.formulaLabel.text! += "8"
        case "9":
            self.formulaLabel.text! += "9"
        case "0":
            guard self.formulaLabel.text != "" else {
                return
            }
            self.formulaLabel.text! += "0"
            
        case "C":
            self.formulaLabel.text! = ""
            self.navigationController?.popToRootViewController(animated: true)
        case "計算":
            guard self.formulaLabel.text != "" else {
                return
            }
            let expression = Expression(formulaLabel.text!)
            do {
                let result = try expression.evaluate()
                print(result)
                formulaLabel.text = "計算結果 : " + String(result)
                calButton.setTitle("戻る", for: .normal)
            } catch {
                print("Error")
                self.navigationController?.popToRootViewController(animated: true)
            }
        case "戻る":
            self.navigationController?.popToRootViewController(animated: true)
            
        default:
            print("default")
        }
    }
}
