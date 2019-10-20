//
//  DescLabel.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class DescLabel: UILabel {
    
    let defaultFont:UIFont
    
    init(whiteText: String, cyanText: String, font: UIFont) {
        self.defaultFont = font
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.textAlignment = .left
        self.numberOfLines = 0
        
        setText(whiteText: whiteText, cyanText: cyanText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(whiteText: String, cyanText: String) {
        let text = "\(whiteText)\n\(cyanText)"
        let attrString = NSMutableAttributedString(
            string: text,
            attributes: [NSAttributedString.Key.font: self.defaultFont])
        let endWhiteText = whiteText.count + 1
        let cyanTextLength = cyanText.count
        attrString.addAttributes([NSAttributedString.Key.foregroundColor: Colors.textColor], range: NSRange(location: 0, length: text.count))
        attrString.addAttributes([NSAttributedString.Key.foregroundColor: Colors.cyan], range: NSRange(location: endWhiteText, length: cyanTextLength))
        
        self.attributedText = attrString
    }
    
}
