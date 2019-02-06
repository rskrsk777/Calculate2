

import UIKit


class OperatingInputViewController: UIViewController {
    
    var operating = ""
    var operatingLabel: UILabel!
    
    var additionButton = CalculateNumberButton(text: "+", color: UIColor.purple)
    var subtractionButton = CalculateNumberButton(text: "-", color: UIColor.purple)
    var multiplicationButton = CalculateNumberButton(text: "*", color: UIColor.purple)
    var divisionButton = CalculateNumberButton(text: "/", color: UIColor.purple)
    var calButton = CalculateNumberButton(text: "計算", color: UIColor.purple)
    var operationButtonArray: [CalculateNumberButton]!
    
    init(operating: String) {
        super.init(nibName: nil, bundle: nil)
        self.operating = operating
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        operatingLabel = UILabel(frame: CGRect(x: 0, y: 100 + (self.navigationController?.navigationBar.frame.height)!, width: screenSize.width, height: 50))
        operatingLabel.text = operating
        operatingLabel.layer.borderWidth = 2
        operatingLabel.layer.borderColor = UIColor.white.cgColor
        operatingLabel.backgroundColor = UIColor.gray
        operatingLabel.textAlignment = NSTextAlignment.center
        operatingLabel.adjustsFontSizeToFitWidth = true
        self.view.addSubview(operatingLabel)

        var widthArray: [CGFloat] = []
        var widthArrayNumber: CGFloat = 0.0
        for _ in 0..<4 {
            widthArrayNumber += UIScreen.main.bounds.width / 5.0
            widthArray.append(widthArrayNumber)
        }
        print(widthArray)
        
        operationButtonArray = [additionButton, subtractionButton, multiplicationButton, divisionButton]
        for i in 0..<operationButtonArray.count {
            self.view.addSubview(operationButtonArray[i])
            operationButtonArray[i].translatesAutoresizingMaskIntoConstraints = false
            let y = operatingLabel.frame.maxY + ((screenSize.height - operatingLabel.frame.maxY - (self.navigationController?.navigationBar.frame.height)!) / 2.0)
            operationButtonArray[i].center = CGPoint(x: widthArray[i], y: y)
            
            
            //operationButtonArray[i].leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: widthArray[i] - (operationButtonArray[i].frame.width / 2.0)).isActive = true
            //operationButtonArray[i].topAnchor.constraint(equalTo: operatingLabel.bottomAnchor, constant: 200).isActive = true
            
            operationButtonArray[i].addTarget(self, action: #selector(self.tappedOperatorButton(_:)), for: UIControl.Event.touchDown)
        }
        
        self.view.backgroundColor = UIColor.darkGray
        
    }
    
    @objc func tappedOperatorButton(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "+":
            self.operatingLabel.text! += "+"
        case "-":
            self.operatingLabel.text! += "-"
        case "*":
            self.operatingLabel.text! += "*"
        case "/":
            self.operatingLabel.text! += "/"
        default:
            print("default")
        }
        
        let next = SecondOperandViewController(formula: operatingLabel.text!)
        self.navigationController?.pushViewController(next, animated: true)
        
    }
    
}
