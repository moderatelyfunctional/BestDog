//
//  RLabel.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class RLabel: UILabel {
    
    init(text: String, font: UIFont) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.text = text
        self.textColor = Colors.textColor
        self.textAlignment = .center
        self.numberOfLines = 0
        
        self.font = font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
