//
//  ViewController.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class VizViewController: NavbarViewController {
    
    let dateCycler = DateCycler()
    let sleepContainer = GIFDescriptor(gifName: "bunny_sleep_please", descriptorText: "Slept for", descriptorTime: "4 hrs 20 mins")
    let walkContainer = GIFDescriptor(gifName: "bunny_walk", descriptorText: "Walked for", descriptorTime: "3 minutes")
    let walkText = RLabel(
        text: "Let's go\nfor a walk?",
        font: UIFont(name: "Quicksand-Bold", size: 24)!)
    let confirmButton = ConfirmButton(text: "Yes!")
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.confirmButton.addTarget(self, action: #selector(VizViewController.presentARController), for: .touchUpInside)
        
        self.view.backgroundColor = Colors.purpleBackground
        
        self.view.addSubview(self.dateCycler)
        self.view.addSubview(self.sleepContainer)
        self.view.addSubview(self.walkContainer)
        self.view.addSubview(self.walkText)
        self.view.addSubview(self.confirmButton)
        addConstraints()
    }
    
    func addConstraints() {
        self.view.addConstraint(RConstraint.paddingPositionConstraint(view: self.dateCycler, side: .top, padding: 64))
        self.view.addConstraint(RConstraint.equalConstraint(firstView: self.view, secondView: self.dateCycler, attribute: .centerX))
        
        self.view.addConstraint(RConstraint.verticalSpacingConstraint(upperView: self.dateCycler, lowerView: self.sleepContainer, spacing: 80))
        
        self.view.addConstraints(RConstraint.paddingPositionConstraints(view: self.sleepContainer, sides: [.left, .right], padding: 25))
        self.view.addConstraint(RConstraint.fillYConstraints(view: self.sleepContainer, heightRatio: 0.2))
        
        self.view.addConstraint(RConstraint.verticalSpacingConstraint(upperView: self.sleepContainer, lowerView: self.walkContainer, spacing: 40))
        self.view.addConstraints(RConstraint.paddingPositionConstraints(view: self.walkContainer, sides: [.left, .right], padding: 25))
        self.view.addConstraint(RConstraint.fillYConstraints(view: self.walkContainer, heightRatio: 0.2))

        self.view.addConstraint(RConstraint.verticalSpacingConstraint(upperView: self.walkContainer, lowerView: self.walkText, spacing: 30))
        self.view.addConstraint(RConstraint.equalConstraint(firstView: self.view, secondView: self.walkText, attribute: .centerX))
        
        self.view.addConstraint(RConstraint.verticalSpacingConstraint(upperView: self.walkText, lowerView: self.confirmButton, spacing: 30))
        self.view.addConstraint(RConstraint.equalConstraint(firstView: self.view, secondView: self.confirmButton, attribute: .centerX))
    }
    
    @objc func presentARController() {
        let arViewController = ARViewController()
        self.present(arViewController, animated: true, completion: nil)
    }
    
}
