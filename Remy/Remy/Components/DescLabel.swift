//
//  DescLabel.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class DescLabel: UILabel {
    
    init(whiteText: String, cyanText: String, font: UIFont) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let text = "\(whiteText)\n\(cyanText)"
        let attrString = NSMutableAttributedString(
            string: text,
            attributes: [NSAttributedString.Key.font: font])
        let endWhiteText = whiteText.count + 1
        let cyanTextLength = cyanText.count
        attrString.addAttributes([NSAttributedString.Key.foregroundColor: Colors.textColor], range: NSRange(location: 0, length: text.count))
        attrString.addAttributes([NSAttributedString.Key.foregroundColor: Colors.cyan], range: NSRange(location: endWhiteText, length: cyanTextLength))
        
        self.attributedText = attrString
        self.textAlignment = .left
        self.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
