//
//  Constants.swift
//  Remy
//
//  Created by Jing Lin on 10/19/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

struct Colors {
    static let textColor = UIColor.white
    static let galaxyBackground = UIColor(patternImage: UIImage(named: "ar_home_bg")!)
    static let purpleBackground = UIColor(red: 96.0/255, green: 94.0/255, blue: 149.0/255, alpha: 1.0)
    static let pink = UIColor(red: 202.0/255, green: 96.0/255, blue: 122.0/255, alpha: 1.0)
    static let darkerPink = UIColor(red: 178.0/255, green: 59.0/255, blue: 88.0/255, alpha: 1.0)
    static let cyan = UIColor(red: 113.0/255, green: 241.0/255, blue: 228.0/255, alpha: 1.0)
    static let clear = UIColor.clear
}

struct Dims {
    static let w = UIScreen.main.bounds.width
    static let h = UIScreen.main.bounds.height
}

struct Enter {
    static let GIFHeight = Dims.w * 0.65
    static let jumpOffset:CGFloat = (480/812) * Dims.h - GIFHeight * (42/193)
}

