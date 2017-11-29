//
//  GridView.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 29/11/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import UIKit
import PureLayout

class GridView: UIView {
    
    private var _leftGutter: UIView! {
        didSet {
            _leftGutter.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.5)
        }
    }
    private var _rightGutter: UIView!
    
    private var _column1: UIView!
    private var _column2: UIView!
    private var _column3: UIView!
    private var _column4: UIView!
    private var _column5: UIView!
    private var _column6: UIView!
    private var _column7: UIView!
    private var _column8: UIView!
    private var _column9: UIView!
    private var _column10: UIView!
    private var _column11: UIView!
    private var _column12: UIView!
    
    private var _margin1: UIView!
    private var _margin2: UIView!
    private var _margin3: UIView!
    private var _margin4: UIView!
    private var _margin5: UIView!
    private var _margin6: UIView!
    private var _margin7: UIView!
    private var _margin8: UIView!
    private var _margin9: UIView!
    private var _margin10: UIView!
    private var _margin11: UIView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.userInteractionEnabled = false
        _createUI()
        _layoutUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func _createUI() {
        _leftGutter = UIView(forAutoLayout: ())
        
    }
    
    private func _layoutUI() {
        self.addSubview(_leftGutter)
        _leftGutter.autoSetDimension(.Width, toSize: Grid.gutter)
        _leftGutter.autoPinEdgeToSuperviewEdge(.Top)
        _leftGutter.autoPinEdgeToSuperviewEdge(.Bottom)
        _leftGutter.autoPinEdgeToSuperviewEdge(.Left)
    }
    
    
}
