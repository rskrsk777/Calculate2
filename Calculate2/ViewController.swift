
import UIKit

let screenSize = UIScreen.main.bounds.size

class ViewController: UIViewController {

    var oneButton = UIButton.calculateNumberUIButton(text: "1", origin: CGPoint(x: 30, y: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray
        view.addSubview(oneButton)
    }


}


extension UIButton {
    static func calculateNumberUIButton (text: String, origin: CGPoint) -> UIButton {
        let button = UIButton()
        button.frame = CGRect(origin: origin, size: CGSize(width: 60, height: 60))
        button.setTitle(text, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.layer.cornerRadius = 20
        button.layer.shadowOpacity = 0.2
        button.backgroundColor = UIColor.blue
        return button
    }
}
