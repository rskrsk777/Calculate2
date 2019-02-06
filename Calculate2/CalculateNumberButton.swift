import UIKit

class CalculateNumberButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    init (text: String, color: UIColor) {
        super.init(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        self.setTitle(text, for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        self.layer.cornerRadius = 20
        self.layer.shadowOpacity = 0.2
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = color
    }
    
    init (frame: CGRect, text: String, color: UIColor) {
        super.init(frame: frame)
        self.setTitle(text, for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        self.layer.cornerRadius = 20
        self.layer.shadowOpacity = 0.2
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
