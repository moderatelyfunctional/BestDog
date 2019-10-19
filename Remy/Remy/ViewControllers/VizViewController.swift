//
//  VizViewController.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class VizViewController: NavbarViewController {
    
    let dateCycler = DateCycler()
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.purpleBackground
        
        self.view.addSubview(self.dateCycler)
        addConstraints()
    }
    
    func addConstraints() {
        self.view.addConstraint(RConstraint.paddingPositionConstraint(view: self.dateCycler, side: .top, padding: 64))
//        self.view.addConstraints(RConstraint.paddingPositionConstraints(view: self.dateCycler, sides: [.left, .right], padding: 24))
        self.view.addConstraint(RConstraint.equalConstraint(firstView: self.view, secondView: self.dateCycler, attribute: .centerX))
//        self.view.addConstraint(RConstraint.fillYConstraints(view: self.dateCycler, heightRatio: 0.1))
        self.dateCycler.backgroundColor = UIColor.green
    }
    
}
