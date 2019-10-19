//
//  AR.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import ARKit

func createARNode(name: String, path: String, eX: CGFloat, eY: CGFloat, eZ: CGFloat) -> SCNNode {
    let scene = SCNScene(named: path)!
    let currNode = scene.rootNode.childNode(withName: "bunny", recursively: false)!
    currNode.position = SCNVector3(0, 0, 0)
    currNode.eulerAngles = SCNVector3(eX, eY, eZ)
    
    return currNode
}
