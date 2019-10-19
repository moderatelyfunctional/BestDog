//
//  Container.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class Container: UIView {
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
