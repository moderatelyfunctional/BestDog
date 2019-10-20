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
    
    init() {
        let bunnyScene = SCNScene(named: "art.scnassets/bunny.scn")
        self.currBunny = bunnyScene!.rootNode.childNode(withName: "bunny", recursively: false)
        self.currBunny.scale = SCNVector3(x: 0.1, y: 0.1, z: 0.1)
        self.currBunny.position = SCNVector3(0, 0, 10)
//        self.currBunny.isHidden = true)
        
        self.sceneView = ARSCNView(frame: UIScreen.main.bounds)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.debugOptions = .showFeaturePoints
                
        self.view.addSubview(self.sceneView)
        
        sceneView.scene.rootNode.addChildNode(self.currBunny)
//        loadAnimations()
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
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal

        // Run the view's session
        sceneView.session.run(configuration)
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
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        let width = CGFloat(planeAnchor.extent.x)
        let height = CGFloat(planeAnchor.extent.z)
        let plane = SCNPlane(width: width, height: height)
        
        plane.materials.first?.diffuse.contents = Colors.clear
        
        let planeNode = SCNNode(geometry: plane)
        
        let x = CGFloat(planeAnchor.center.x)
        let y = CGFloat(planeAnchor.center.y)
        let z = CGFloat(planeAnchor.center.z)
        planeNode.position = SCNVector3(x,y,z)
        planeNode.eulerAngles.x = -.pi / 2
        
        node.addChildNode(planeNode)

        _updateBunny(rootNode: node, planeNode: planeNode)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as?  ARPlaneAnchor,
            let planeNode = node.childNodes.first,
            let plane = planeNode.geometry as? SCNPlane
            else { return }

        let width = CGFloat(planeAnchor.extent.x)
        let height = CGFloat(planeAnchor.extent.z)
        plane.width = width
        plane.height = height

        let x = CGFloat(planeAnchor.center.x)
        let y = CGFloat(planeAnchor.center.y)
        let z = CGFloat(planeAnchor.center.z)
        planeNode.position = SCNVector3(x, y, z)
        
        _updateBunny(rootNode: node, planeNode: planeNode)
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
