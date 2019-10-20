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
    let descriptor:DescLabel
    
    init(gifName: String, descriptorText: String, descriptorTime: String) {
        self.gif = RGIF(name: gifName)
        self.descriptor = DescLabel(
            whiteText: descriptorText,
            cyanText: descriptorTime,
            font: UIFont(name: "Quicksand-Bold", size: 22)!)
        
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.gif)
        self.addSubview(self.descriptor)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        self.addConstraint(RConstraint.paddingPositionConstraint(view: self.gif, side: .left, padding: -20))
        self.addConstraint(RConstraint.equalConstraint(firstView: self, secondView: self.gif, attribute: .centerY))
        self.addConstraints(RConstraint.squareWidthConstraints(view: self.gif, squareRatio: 0.6))
        
        self.addConstraint(RConstraint.horizontalSpacingConstraint(leftView: self.gif, rightView: self.descriptor, spacing: -10))

        self.addConstraint(RConstraint.equalConstraint(firstView: self, secondView: self.descriptor, attribute: .centerY))
        self.addConstraint(RConstraint.paddingPositionConstraint(view: self.descriptor, side: .right, padding: 0))
    }
    
}
