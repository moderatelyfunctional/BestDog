//
//  EnterViewController.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class EnterViewController: UIViewController {

    let helloText = RLabel(
        text: "Hello,\nI'm Remy",
        font: UIFont(name: "Quicksand-Bold", size: 20)!)
    let enterButton = EnterButton(backgroundImg: "enterIcon")
    let enter = RLabel(
        text: "Enter",
        font: UIFont(name: "Quicksand-Regular", size: 24)!)
    let planetView = RImageView(name: "ar_home_planet")
    let bunnyGIF = RGIF(name: "bunny-jump")
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.background
                
        self.view.addSubview(self.planetView)
        self.view.addSubview(self.bunnyGIF)
        self.view.addSubview(self.helloText)
        self.view.addSubview(self.enterButton)
        self.view.addSubview(self.enter)
        addConstraints()
    }
    
    func addConstraints() {
        self.view.addConstraints(RConstraint.paddingPositionConstraints(view: self.planetView, sides: [.left, .top, .right, .bottom], padding: 0))
        
        self.view.addConstraint(RConstraint.equalConstraint(firstView: self.view, secondView: self.bunnyGIF, attribute: .centerX))
        self.view.addConstraint(RConstraint.paddingPositionConstraint(view: self.bunnyGIF, side: .bottom, padding: Enter.jumpOffset))
        self.view.addConstraints(RConstraint.squareWidthConstraints(view: self.bunnyGIF, squareRatio: 0.65))
        
        self.view.addConstraint(RConstraint.equalConstraint(firstView: self.bunnyGIF, secondView: self.helloText, attribute: .centerY))
        self.view.addConstraint(RConstraint.paddingPositionConstraint(view: self.helloText, side: .left, padding: 40))
        
        self.view.addConstraint(RConstraint.equalConstraint(firstView: self.view, secondView: self.enterButton, attribute: .centerX))
        self.view.addConstraint(RConstraint.verticalSpacingConstraint(upperView: self.enterButton, lowerView: self.enter, spacing: 20))
        self.view.addConstraints(RConstraint.squareWidthConstraints(view: self.enterButton, squareRatio: 0.2))
        
        self.view.addConstraints(RConstraint.paddingPositionConstraints(view: self.enter, sides: [.left, .bottom, .right], padding: 20))
    }
    
}
