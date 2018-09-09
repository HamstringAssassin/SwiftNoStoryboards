//
//  QuestionCollectionViewCell.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 13/08/2018.
//  Copyright © 2018 Alan O'Connor. All rights reserved.
//

import UIKit
import PureLayout

class QuestionCollectionViewCell: UICollectionViewCell {
    
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
        layoutUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        self.label = UILabel()
    }
    
    func layoutUI() {
        self.addSubview(label)
        label.autoCenterInSuperview()
    }
}
