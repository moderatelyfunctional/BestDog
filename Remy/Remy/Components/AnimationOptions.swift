//
//  AnimationOptions.swift
//  Remy
//
//  Created by Jing Lin on 10/20/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class AnimationOptions: UIView {
    
    let options = ["C", "J", "W", "S", "2D"]
    var buttons:[SelectionButton] = []
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
                
        self.backgroundColor = Colors.pink
        
        for option in options {
            let button = SelectionButton(text: option)

            self.addSubview(button)
            self.buttons.append(button)
        }
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        self.addConstraints(RConstraint.paddingPositionConstraints(view: self.buttons[0], sides: [.left, .top, .right], padding: 0))
        
        self.addConstraint(RConstraint.verticalSpacingConstraint(upperView: self.buttons[0], lowerView: self.buttons[1], spacing: 0))
        self.addConstraint(RConstraint.verticalSpacingConstraint(upperView: self.buttons[1], lowerView: self.buttons[2], spacing: 0))
        self.addConstraint(RConstraint.verticalSpacingConstraint(upperView: self.buttons[2], lowerView: self.buttons[3], spacing: 0))
        self.addConstraint(RConstraint.verticalSpacingConstraint(upperView: self.buttons[3], lowerView: self.buttons[4], spacing: 0))
        
        self.addConstraints(RConstraint.paddingPositionConstraints(view: self.buttons[1], sides: [.left, .right], padding: 0))
        self.addConstraints(RConstraint.paddingPositionConstraints(view: self.buttons[2], sides: [.left, .right], padding: 0))
        self.addConstraints(RConstraint.paddingPositionConstraints(view: self.buttons[3], sides: [.left, .right], padding: 0))
        self.addConstraints(RConstraint.paddingPositionConstraints(view: self.buttons[4], sides: [.left, .bottom, .right], padding: 0))
    }
    
    func setSelected(sender: SelectionButton) {
        for button in self.buttons {
            button.backgroundColor = button == sender ? Colors.darkerPink : Colors.pink
        }
    }
    
}
