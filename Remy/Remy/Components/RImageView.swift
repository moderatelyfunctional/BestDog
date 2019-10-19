//
//  RImageView.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class RImageView: UIImageView {
    
    init(name: String) {
        super.init(image: UIImage(named: name))
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
