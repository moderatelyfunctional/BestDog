//
//  DateCycler.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class DateCycler: UIView {
    
    let lessThan = RImageView(name: "less_than")
    let greaterThan = RImageView(name: "greater_than")
    let dateString = RLabel(text: "", font: UIFont(name: "Quicksand-Bold", size: 24)!)
    let formatter = DateFormatter()
    let date = NSDate()
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let whiteLessThan = self.lessThan.image?.withTintColor(Colors.textColor)
        let whiteGreaterThan = self.greaterThan.image?.withTintColor(Colors.textColor)
        
        self.lessThan.image = whiteLessThan
        self.greaterThan.image = whiteGreaterThan
        
        self.formatter.dateFormat = "MMM d, yyyy"
        self.dateString.text = self.formatter.string(from: self.date as Date)
        
        self.addSubview(self.lessThan)
        self.addSubview(self.greaterThan)
        self.addSubview(self.dateString)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        self.addConstraint(RConstraint.paddingPositionConstraint(view: self.lessThan, side: .left, padding: 15))
        self.addConstraint(RConstraint.equalConstraint(firstView: self, secondView: self.lessThan, attribute: .centerY))
        
        self.addConstraint(RConstraint.horizontalSpacingConstraint(leftView: self.lessThan, rightView: self.dateString, spacing: 50))
        self.addConstraint(RConstraint.equalConstraint(firstView: self.lessThan, secondView: self.dateString, attribute: .centerY))
        self.addConstraint(RConstraint.horizontalSpacingConstraint(leftView: self.dateString, rightView: self.greaterThan, spacing: 50))

        self.addConstraint(RConstraint.paddingPositionConstraint(view: self.greaterThan, side: .right, padding: 15))
        self.addConstraint(RConstraint.equalConstraint(firstView: self, secondView: self.greaterThan, attribute: .centerY))
    }
    
}
