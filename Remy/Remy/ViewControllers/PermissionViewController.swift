//
//  PermissionViewController.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class PermissionsViewController: FullModalViewController {

    let container = Container()
    let permissionText = RLabel(
        text: "Remy requires data from the following applications",
        font: UIFont(name: "Quicksand-Bold", size: 24)!)
    let externalPermissions = PermissionsContainer()
    let confirmButton = ConfirmButton()
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.confirmButton.addTarget(self, action: #selector(PermissionsViewController.showVizualization), for: .touchUpInside)
        
        self.view.backgroundColor = Colors.purpleBackground
        
        self.container.addSubview(self.permissionText)
        self.container.addSubview(self.externalPermissions)
        self.container.addSubview(self.confirmButton)
        
        self.view.addSubview(self.container)
        addConstraints()
    }
    
    func addConstraints() {
        self.container.addConstraints(RConstraint.paddingPositionConstraints(view: self.permissionText, sides: [.left, .top, .right], padding: 0))
        self.container.addConstraint(RConstraint.verticalSpacingConstraint(upperView: self.permissionText, lowerView: self.externalPermissions, spacing: 20))
        self.container.addConstraints(RConstraint.paddingPositionConstraints(view: self.externalPermissions, sides: [.left, .right], padding: 30))

        self.container.addConstraint(RConstraint.verticalSpacingConstraint(upperView: self.externalPermissions, lowerView: self.confirmButton, spacing: 60))
        self.container.addConstraint(RConstraint.paddingPositionConstraint(view: self.confirmButton, side: .bottom, padding: 80))
        self.view.addConstraint(RConstraint.equalConstraint(firstView: self.container, secondView: self.confirmButton, attribute: .centerX))

        self.view.addConstraints(RConstraint.centerAlignConstraints(firstView: self.view, secondView: self.container))
        self.view.addConstraints(RConstraint.paddingPositionConstraints(view: self.container, sides: [.left, .right], padding: 25))
    }
    
    @objc func showVizualization() {
        let vizualizationVC = VizViewController()
        self.present(vizualizationVC, animated: true, completion: nil)
        
    }
    
}
