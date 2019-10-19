//
//  EnterButton.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class EnterButton: UIButton {
    
    init(backgroundImg: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let img = UIImage(named: backgroundImg)!.withRenderingMode(.alwaysTemplate)
    
        self.tintColor = Colors.textColor
        self.setImage(img, for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
