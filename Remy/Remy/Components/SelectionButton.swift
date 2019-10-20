//
//  SelectionButton.swift
//  Remy
//
//  Created by Jing Lin on 10/20/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class SelectionButton: UIButton {
    
    init(text: String) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = Colors.pink
        self.contentEdgeInsets = UIEdgeInsets(top: 10.0, left: 14.0, bottom: 10.0, right: 14.0)
        self.setTitle(text, for: .normal)
        self.titleLabel!.font = UIFont(name: "Quicksand-Bold", size: 14)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}

