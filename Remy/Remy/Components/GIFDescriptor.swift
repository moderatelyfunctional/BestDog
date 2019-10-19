//
//  GIFDescriptor.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class GIFDescriptor: UIView {
    
    let gif:RGIF
    let descriptor:RLabel
    
    init(gifName: String, descriptor: String) {
        self.gif = RGIF(name: gifName)
        self.descriptor = RLabel(text: descriptor, font: UIFont(name: "Quicksand-Bold", size: 24)!)
        
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.gif)
        self.addSubview(self.descriptor)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
