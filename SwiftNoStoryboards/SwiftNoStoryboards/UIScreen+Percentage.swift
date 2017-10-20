//
//  UIScreen+Percentage.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 20/10/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import UIKit

extension UIScreen {
    class func percentage(multiplier: CGFloat) -> CGFloat {
        return CGFloat(Double(mainScreen().bounds.size.width * multiplier))
    }
}
