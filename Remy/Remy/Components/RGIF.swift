//
//  RGIF.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class RGIF: UIImageView {
    
    init(name: String) {
        let nameGIF = UIImage.gifImageWithName(name)
        super.init(image: nameGIF)
        
        self.contentMode = .scaleAspectFit

        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
