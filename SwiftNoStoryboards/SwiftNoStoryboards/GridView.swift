//
//  GridView.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 29/11/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import UIKit
import PureLayout

class Margin: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class Gutter: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }}

class Column: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }}

class GridView: UIView {
    
    private var _leftGutter: Gutter!
    private var _rightGutter: Gutter!
    
    private var _column1: Column!
    private var _column2: Column!
    private var _column3: Column!
    private var _column4: Column!
    private var _column5: Column!
    private var _column6: Column!
    private var _column7: Column!
    private var _column8: Column!
    private var _column9: Column!
    private var _column10: Column!
    private var _column11: Column!
    private var _column12: Column!
    
    private var _margin1: Margin!
    private var _margin2: Margin!
    private var _margin3: Margin!
    private var _margin4: Margin!
    private var _margin5: Margin!
    private var _margin6: Margin!
    private var _margin7: Margin!
    private var _margin8: Margin!
    private var _margin9: Margin!
    private var _margin10: Margin!
    private var _margin11: Margin!
    
    
    
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
        UIView.compact ? _createCompactUI() : _createStandardUI()
        
        
    }
    
    private func _createCompactUI() {
        self._margin1 = Margin(forAutoLayout: ())
        self._column1 = Column(forAutoLayout: ())
        
        self._margin2 = Margin(forAutoLayout: ())
        self._column2 = Column(forAutoLayout: ())
        
        self._margin3 = Margin(forAutoLayout: ())
        self._column3 = Column(forAutoLayout: ())
        
        self._margin4 = Margin(forAutoLayout: ())
        self._column4 = Column(forAutoLayout: ())
        
        self._margin5 = Margin(forAutoLayout: ())
    }
    
    private func _createStandardUI() {
        _leftGutter = Gutter(forAutoLayout: ())
    }
    
    private func _layoutUI() {
        UIView.compact ? _layoutCompactUI() : _layoutStandardUI()
    }
    
    private func _layoutCompactUI() {
        self.addSubview(_margin1)
        _margin1.autoSetDimension(.Width, toSize: Grid.margin)
        _margin1.autoPinEdgeToSuperviewEdge(.Left)
        _margin1.autoPinEdgeToSuperviewEdge(.Top)
        _margin1.autoPinEdgeToSuperviewEdge(.Bottom)
        
        self.addSubview(_column1)
        _column1.autoSetDimension(.Width, toSize: Grid.column)
        _column1.autoPinEdgeToSuperviewEdge(.Top)
        _column1.autoPinEdgeToSuperviewEdge(.Bottom)
        _column1.autoPinEdge(.Left, toEdge: .Right, ofView: _margin1)
        
        self.addSubview(_margin2)
        _margin2.autoSetDimension(.Width, toSize: Grid.margin)
        _margin2.autoPinEdge(.Left, toEdge: .Right, ofView: _column1)
        _margin2.autoPinEdgeToSuperviewEdge(.Top)
        _margin2.autoPinEdgeToSuperviewEdge(.Bottom)
        
        self.addSubview(_column2)
        _column2.autoSetDimension(.Width, toSize: Grid.column)
        _column2.autoPinEdgeToSuperviewEdge(.Top)
        _column2.autoPinEdgeToSuperviewEdge(.Bottom)
        _column2.autoPinEdge(.Left, toEdge: .Right, ofView: _margin2)
        
        
        self.addSubview(_margin3)
        _margin3.autoSetDimension(.Width, toSize: Grid.margin)
        _margin3.autoPinEdge(.Left, toEdge: .Right, ofView: _column2)
        _margin3.autoPinEdgeToSuperviewEdge(.Top)
        _margin3.autoPinEdgeToSuperviewEdge(.Bottom)
        
        self.addSubview(_column3)
        _column3.autoSetDimension(.Width, toSize: Grid.column)
        _column3.autoPinEdgeToSuperviewEdge(.Top)
        _column3.autoPinEdgeToSuperviewEdge(.Bottom)
        _column3.autoPinEdge(.Left, toEdge: .Right, ofView: _margin3)
        
        self.addSubview(_margin4)
        _margin4.autoSetDimension(.Width, toSize: Grid.margin)
        _margin4.autoPinEdge(.Left, toEdge: .Right, ofView: _column3)
        _margin4.autoPinEdgeToSuperviewEdge(.Top)
        _margin4.autoPinEdgeToSuperviewEdge(.Bottom)
        
        self.addSubview(_column4)
        _column4.autoSetDimension(.Width, toSize: Grid.column)
        _column4.autoPinEdgeToSuperviewEdge(.Top)
        _column4.autoPinEdgeToSuperviewEdge(.Bottom)
        _column4.autoPinEdge(.Left, toEdge: .Right, ofView: _margin4)
        
        
        self.addSubview(_margin5)
        _margin5.autoSetDimension(.Width, toSize: Grid.margin)
        _margin5.autoPinEdge(.Left, toEdge: .Right, ofView: _column4)
        _margin5.autoPinEdgeToSuperviewEdge(.Top)
        _margin5.autoPinEdgeToSuperviewEdge(.Bottom)
        
        
    }
    
    private func _layoutStandardUI() {
        self.addSubview(_leftGutter)
        _leftGutter.autoSetDimension(.Width, toSize: Grid.gutter)
        _leftGutter.autoPinEdgeToSuperviewEdge(.Top)
        _leftGutter.autoPinEdgeToSuperviewEdge(.Bottom)
        _leftGutter.autoPinEdgeToSuperviewEdge(.Left)
    }
    
}
