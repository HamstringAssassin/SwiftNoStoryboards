//
//  UpdatingCell.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 20/10/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import UIKit

class UpdatingCell: UICollectionViewCell {
    
    static let prototype = UpdatingCell()
    
    private var _textLabel: UILabel! {
        didSet {
            _textLabel.text = "Some text"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _createUI()
        _layoutUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _createUI() {
        _textLabel = UILabel(forAutoLayout: ())
    }
    
    private func _layoutUI() {
        self.contentView.autoSetDimension(.Width, toSize: UIScreen.percentage(0.8))
        
        self.contentView.addSubview(_textLabel)
        _textLabel.autoPinEdgesToSuperviewEdges()
    }
}

