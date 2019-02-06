
import UIKit

let screenSize = UIScreen.main.bounds.size

class ViewController: UIViewController {

    var numberLabel: UILabel!
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationItem.title = "計算"
        // self.navigationController?.navigationBar.tintColor = UIColor.purple
        // self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.prefersLargeTitles = true
        numberLabel = UILabel(frame: CGRect(x: 0, y: 100 + (self.navigationController?.navigationBar.frame.height)!, width: screenSize.width, height: 50))
        numberLabel.text = ""
        numberLabel.font = UIFont.systemFont(ofSize: 30)
        numberLabel.layer.borderWidth = 2
        numberLabel.layer.borderColor = UIColor.white.cgColor
        numberLabel.backgroundColor = UIColor.gray
        numberLabel.textAlignment = NSTextAlignment.center
        numberLabel.adjustsFontSizeToFitWidth = true
        
        buttonArray = [oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton, zeroButton, clearButton, calButton]
 
        for button in buttonArray {
            button.addTarget(self, action: #selector(self.tappedNumberButton(_:)), for: UIControl.Event.touchDown)
        }
        view.backgroundColor = UIColor.darkGray

        var widthArray: [CGFloat] = []
        var widthArrayNumber: CGFloat = 0.0
        var heightArray: [CGFloat] = []
        var heightArrayNumber:CGFloat = self.numberLabel.frame.maxY
        for _ in 0..<3 {
            widthArrayNumber = widthArrayNumber + (screenSize.width / 4.0)
            widthArray.append(widthArrayNumber)
        }
        for _ in 0..<4 {
            heightArrayNumber = heightArrayNumber + ((screenSize.height - self.numberLabel.frame.maxY) / 6.0)
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
        

        /*
        buttonArray[0].center = CGPoint(x: widthArray[0], y: heightArray[0])
        buttonArray[1].center = CGPoint(x: widthArray[1], y: heightArray[0])
        buttonArray[3].center = CGPoint(x: widthArray[2], y: heightArray[0])
        buttonArray[4].center = CGPoint(x: widthArray[3], y: heightArray[1])
 */
        print("heightArray: ", heightArray)
        print("widthArrawy: ", widthArray)
        print("maxY:", self.numberLabel.bounds.maxY)
        print("maxYFrame: ", self.numberLabel.frame.maxY)
        view.addSubview(numberLabel)
        for button in buttonArray {
            view.addSubview(button)
        }
        
        
        
        
    }

    
    @objc func tappedNumberButton (_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "1":
            self.numberLabel.text! += "1"
        case "2":
            self.numberLabel.text! += "2"
        case "3":
            self.numberLabel.text! += "3"
        case "4":
            self.numberLabel.text! += "4"
        case "5":
            self.numberLabel.text! += "5"
        case "6":
            self.numberLabel.text! += "6"
        case "7":
            self.numberLabel.text! += "7"
        case "8":
            self.numberLabel.text! += "8"
        case "9":
            self.numberLabel.text! += "9"
        case "0":
            guard self.numberLabel.text != "" else {
                return
            }
            self.numberLabel.text! += "0"
            
        case "C":
            self.numberLabel.text! = ""
            
        case "計算":
            guard self.numberLabel.text != "" else {
                return
            }
            let next = OperatingInputViewController(operating: self.numberLabel.text!)
            self.navigationController?.pushViewController(next, animated: true)
        default:
            print("default")
        }
    }
}


extension UIButton {
    static func spawnCalculateNumberUIButton (text: String, origin: CGPoint) -> UIButton {
        let button = UIButton()
        button.frame = CGRect(origin: origin, size: CGSize(width: 60, height: 60))
        button.setTitle(text, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.layer.cornerRadius = 20
        button.layer.shadowOpacity = 0.2
        button.backgroundColor = UIColor.blue
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }
}

