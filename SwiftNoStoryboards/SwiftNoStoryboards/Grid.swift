//
//  Grid.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 29/11/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import Foundation
import UIKit

class Grid {
    /// 20% small / 6% large
    static let column: CGFloat = UIScreen.percentage(multiplier: UIView.compact ? 0.20 : 0.06)
    /// 4% small / 2% large
    static let margin: CGFloat = UIScreen.percentage(multiplier: UIView.compact ? 0.04 : 0.02)
    /// 4% small / 3% large
    static let gutter: CGFloat = UIScreen.percentage(multiplier: UIView.compact ? 0.04 : 0.03)
    
    static let numberOfGutters = UIView.compact ? 0 : 2
    static let numberOfMargins = UIView.compact ? 5 : 11
    static let numberOfColumns = UIView.compact ? 4 : 12
}

extension UIView {
    class var compact: Bool {
        return UI_USER_INTERFACE_IDIOM() == .phone
    }
}
