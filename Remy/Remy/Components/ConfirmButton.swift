//
//  ConfirmButton.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class ConfirmButton: UIButton {
    
    init(text: String) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = Colors.pink
        self.contentEdgeInsets = UIEdgeInsets(top: 16.0, left: 20.0, bottom: 16.0, right: 20.0)
        self.setTitle(text, for: .normal)
        self.titleLabel!.font = UIFont(name: "Quicksand-Bold", size: 16)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? Colors.darkerPink : Colors.pink
        }
    }
    
}
