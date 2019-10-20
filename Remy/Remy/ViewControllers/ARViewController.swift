//
//  ARViewController.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARViewController: UIViewController {
    
    let sceneView:ARSCNView
    var currBunny:SCNNode!
    var animations = [String:CAAnimation]()
    
    var timerCounter = 0
    let timerText = RLabel(text: "00:00", font: UIFont(name: "Quicksand-Bold", size: 16)!)
    let confirmButton = ConfirmButton(text: "End Walk")
    
    init() {
        let bunnyScene = SCNScene(named: "art.scnassets/bunny.scn")
        self.currBunny = bunnyScene!.rootNode.childNode(withName: "bunny", recursively: false)
        self.currBunny.scale = SCNVector3(x: 0.1, y: 0.1, z: 0.1)
        self.currBunny.position = SCNVector3(0, 0, 10)
        
        self.sceneView = ARSCNView(frame: UIScreen.main.bounds)
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.timerText.isUserInteractionEnabled = false
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ARViewController.updateTimerText), userInfo: nil, repeats: true)
        
        self.confirmButton.addTarget(self, action: #selector(ARViewController.dismissVC), for: .touchUpInside)
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.debugOptions = .showFeaturePoints
        
        self.view.backgroundColor = UIColor.green
        
        self.view.addSubview(self.confirmButton)
        self.view.addSubview(self.timerText)
        addConstraints()
        
//        sceneView.scene.rootNode.addChildNode(self.currBunny)
//        self.view.addSubview(self.sceneView)
        
//        loadAnimations()
    }
    
    func addConstraints() {
        self.view.addConstraints(RConstraint.paddingPositionConstraints(view: self.confirmButton, sides: [.left, .bottom, .right], padding: 25))
        self.view.addConstraint(RConstraint.fillYConstraints(view: self.confirmButton, heightRatio: 0.075))
        
        self.view.addConstraint(RConstraint.equalConstraint(firstView: self.confirmButton, secondView: self.timerText, attribute: .centerY))
        self.view.addConstraint(RConstraint.paddingPositionConstraint(view: self.timerText, side: .right, padding: 45))
    }
    
    @objc func updateTimerText() {
        self.timerCounter += 1
        let minutes = String(format: "%02d", self.timerCounter / 60)
        let seconds = String(format: "%02d", self.timerCounter % 60)
        self.timerText.text = "\(minutes):\(seconds)"
    }
    
    @objc func dismissVC() {
        ARView.minutesSpent += self.timerCounter
        self.dismiss(animated: true, completion: nil)
    }
    
    func loadAnimations() {
        let walkingScene = SCNScene(named: "art.scnassets/walking.scn")
        
        let node = SCNNode()
        for child in (walkingScene?.rootNode.childNodes)! {
            node.addChildNode(child)
        }
        node.position = SCNVector3(0, -1, -2)
        node.scale = SCNVector3(0.2, 0.2, 0.2)
        
        sceneView.scene.rootNode.addChildNode(node)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        let configuration = ARWorldTrackingConfiguration()
//        configuration.planeDetection = .horizontal
//
//        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}

extension ARViewController: ARSCNViewDelegate {
  
    func _updateBunny(rootNode: SCNNode, planeNode: SCNNode) {
        // does not handle occlusion
        let isVisible = sceneView.isNode(self.currBunny.presentation, insideFrustumOf: sceneView.pointOfView!.presentation)
        if isVisible {
            return
        }
        
        self.currBunny.position = planeNode.position
        self.currBunny.removeFromParentNode()
        rootNode.addChildNode(self.currBunny)
    }

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
//        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
//
//        let width = CGFloat(planeAnchor.extent.x)
//        let height = CGFloat(planeAnchor.extent.z)
//        let plane = SCNPlane(width: width, height: height)
//
//        plane.materials.first?.diffuse.contents = Colors.clear
//
//        let planeNode = SCNNode(geometry: plane)
//
//        let x = CGFloat(planeAnchor.center.x)
//        let y = CGFloat(planeAnchor.center.y)
//        let z = CGFloat(planeAnchor.center.z)
//        planeNode.position = SCNVector3(x,y,z)
//        planeNode.eulerAngles.x = -.pi / 2
//
//        node.addChildNode(planeNode)
//
//        _updateBunny(rootNode: node, planeNode: planeNode)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
//        guard let planeAnchor = anchor as?  ARPlaneAnchor,
//            let planeNode = node.childNodes.first,
//            let plane = planeNode.geometry as? SCNPlane
//            else { return }
//
//        let width = CGFloat(planeAnchor.extent.x)
//        let height = CGFloat(planeAnchor.extent.z)
//        plane.width = width
//        plane.height = height
//
//        let x = CGFloat(planeAnchor.center.x)
//        let y = CGFloat(planeAnchor.center.y)
//        let z = CGFloat(planeAnchor.center.z)
//        planeNode.position = SCNVector3(x, y, z)
//
//        _updateBunny(rootNode: node, planeNode: planeNode)
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
    }
}
