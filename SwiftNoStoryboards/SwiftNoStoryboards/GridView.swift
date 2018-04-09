//
//  GridView.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 29/11/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import UIKit
import PureLayout

//class Layout {
//   class Grid {
//    /// 20% small / 6% large
//    static let column: CGFloat = UIScreen.percentage(multiplier: UIView.compact ? 0.20: 0.06)
//    /// 4% small / 2% large
//    static let margin: CGFloat = UIScreen.percentage(multiplier: UIView.compact ? 0.04: 0.02)
//    /// 4% small / 3% large
//    static let gutter: CGFloat = UIScreen.percentage(multiplier: UIView.compact ? 0.04: 0.03)
//
//    static let numberOfGutters = UIView.compact ? 0 : 2
//    static let numberOfMargins = UIView.compact ? 5 : 11
//    static let numberOfColumns = UIView.compact ? 4 : 12
//    }
//}


class GridView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = false
        layoutUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func layoutUI() {
        UIView.compact ? layoutCompactUI() : layoutStandardUI()
    }
    
    private func layoutCompactUI() {
        
        let allGridViews = Grid.numberOfGutters + Grid.numberOfMargins + Grid.numberOfColumns
        var previousView: UIView? = nil
        
        for idx in 0..<allGridViews {
            if idx == 0 || (idx % 2 == 0) {
                let margin = UIView(forAutoLayout: ())
                margin.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
                self.addSubview(margin)
                margin.autoSetDimension(.width, toSize: Grid.margin)
                margin.autoPinEdge(toSuperviewEdge: .top)
                margin.autoPinEdge(toSuperviewEdge: .bottom)
                
                if let previousView = previousView {
                    margin.autoPinEdge(.left, to: .right, of: previousView)
                } else {
                    margin.autoPinEdge(toSuperviewEdge: .left)
                }
                
                previousView = margin
            } else {
                let column = UIView(forAutoLayout: ())
                column.backgroundColor = UIColor.green.withAlphaComponent(0.2)
                self.addSubview(column)
                column.autoSetDimension(.width, toSize: Grid.column)
                column.autoPinEdge(toSuperviewEdge: .top)
                column.autoPinEdge(toSuperviewEdge: .bottom)
                
                if let previousView = previousView {
                    column.autoPinEdge(.left, to: .right, of: previousView)
                }
                
                previousView = column
            }
        }
        
    }
    
    private func layoutStandardUI() {
        let allGridViews = Grid.numberOfGutters + Grid.numberOfMargins + Grid.numberOfColumns
        var previousView: UIView? = nil
        
        for idx in 0..<allGridViews {
            //gutters
            if idx == 0 || idx == allGridViews-1 {
                let gutter = UIView(forAutoLayout: ())
                gutter.backgroundColor = UIColor.red.withAlphaComponent(0.2)
                self.addSubview(gutter)
                gutter.autoSetDimension(.width, toSize: Grid.gutter)
                gutter.autoPinEdge(toSuperviewEdge: .top)
                gutter.autoPinEdge(toSuperviewEdge: .bottom)
                if let previousView = previousView {
                    gutter.autoPinEdge(.left, to: .right, of: previousView)
                } else {
                    gutter.autoPinEdge(toSuperviewEdge: .left)
                }
                
                previousView = gutter
                
            } else if idx % 2 != 0  { //columns
                let column = UIView(forAutoLayout: ())
                column.backgroundColor = UIColor.green.withAlphaComponent(0.2)
                self.addSubview(column)
                column.autoSetDimension(.width, toSize: Grid.column)
                column.autoPinEdge(toSuperviewEdge: .top)
                column.autoPinEdge(toSuperviewEdge: .bottom)
                if let previousView = previousView {
                    column.autoPinEdge(.left, to: .right, of: previousView)
                }
                previousView = column
                
            } else { //margins
                let margin = UIView(forAutoLayout: ())
                margin.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
                self.addSubview(margin)
                margin.autoSetDimension(.width, toSize: Grid.margin)
                margin.autoPinEdge(toSuperviewEdge: .top)
                margin.autoPinEdge(toSuperviewEdge: .bottom)
                if let previousView = previousView {
                    margin.autoPinEdge(.left, to: .right, of: previousView)
                }
                
                previousView = margin
            }
        }
    }
    
}


