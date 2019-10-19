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
    static let background = UIColor(patternImage: UIImage(named: "ar_home_bg")!)
}

struct Dims {
    static let w = UIScreen.main.bounds.width
    static let h = UIScreen.main.bounds.height
}

struct Enter {
    static let GIFHeight = Dims.w * 0.65
    static let jumpOffset:CGFloat = (480/812) * Dims.h - GIFHeight * (42/193)
}
