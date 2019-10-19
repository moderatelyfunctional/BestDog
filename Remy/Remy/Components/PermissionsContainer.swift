//
//  PermissionsContainer.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class PermissionsContainer: Container {
    
    let permissions = [
        ("google_calendar", "Google Calendar"),
        ("apple_health", "Apple Health")
    ]
    
    let google_img = RImageView(name: "google_calendar")
    let apple_img = RImageView(name: "apple_health")
    let google_desc = RLabel(
        text: "Google Calendar",
        font: UIFont(name: "Quicksand-Bold", size: 24)!)
    let apple_desc = RLabel(
        text: "Apple Health",
        font: UIFont(name: "Quicksand-Bold", size: 24)!)
    
    override init() {
        super.init()
        
        self.google_desc.textAlignment = .left
        self.apple_desc.textAlignment = .left
        
        self.addSubview(self.google_img)
        self.addSubview(self.google_desc)
        self.addSubview(self.apple_img)
        self.addSubview(self.apple_desc)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func addConstraints() {
        self.addConstraints(RConstraint.squareWidthConstraints(view: self.google_img, squareRatio: 0.15))
        self.addConstraints(RConstraint.squareWidthConstraints(view: self.apple_img, squareRatio: 0.15))

        self.addConstraints(RConstraint.paddingPositionConstraints(view: self.google_img, sides: [.left, .top], padding: 0))
        self.addConstraint(RConstraint.horizontalSpacingConstraint(leftView: self.google_img, rightView: self.google_desc, spacing: 20))
        self.addConstraint(RConstraint.equalConstraint(firstView: self.google_img, secondView: self.google_desc, attribute: .centerY))
        self.addConstraint(RConstraint.paddingPositionConstraint(view: self.google_desc, side: .right, padding: 0))
        
        self.addConstraints(RConstraint.paddingPositionConstraints(view: self.apple_img, sides: [.left, .bottom], padding: 0))
        self.addConstraint(RConstraint.verticalSpacingConstraint(upperView: self.google_img, lowerView: self.apple_img, spacing: 24))
        self.addConstraint(RConstraint.horizontalSpacingConstraint(leftView: self.apple_img, rightView: self.apple_desc, spacing: 20))
        self.addConstraint(RConstraint.equalConstraint(firstView: self.apple_img, secondView: self.apple_desc, attribute: .centerY))
        self.addConstraint(RConstraint.paddingPositionConstraint(view: self.apple_desc, side: .right, padding: 0))
    }
    
}
