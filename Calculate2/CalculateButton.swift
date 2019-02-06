//
//  CalculateButton.swift
//  Calculate2
//
//  Created by ryosuke kubo on 2019/01/25.
//  Copyright © 2019 ryosuke kubo. All rights reserved.
//

import UIKit

class CalculateButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    init(text: String, origin: CGPoint, color: UIColor) {
        super.init(frame: CGRect(origin: origin, size: CGSize(width: 60, height: 60)))
        self.setTitle(text, for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        self.layer.cornerRadius = 20
        self.layer.shadowOpacity = 0.2
        self.backgroundColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
