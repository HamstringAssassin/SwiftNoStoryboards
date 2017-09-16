//
//  ChildViewController.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 16/09/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {
    
    private var _label: UILabel! {
        didSet {
            _label.numberOfLines = 0
            _label.text = "Some label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\n10"
            /*"\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\n20\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\n30\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\n40\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\n50\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\n60\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\n70\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\nSome label text\n80\n"*/
            _label.textAlignment = .Center
            _label.backgroundColor = UIColor.cyanColor().colorWithAlphaComponent(0.5)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad")
        _createUI()
        _layoutUI()
        _skinUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        print("updateViewConstraints")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewdidLayoutSubviews")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    
    private func _createUI() {
        _label = UILabel(forAutoLayout: ())
    }
    
    private func _layoutUI() {
        self.view.addSubview(_label)
        _label.autoPinEdge(.Top, toEdge: .Top, ofView: self.view, withOffset: 10)
        _label.autoPinEdgeToSuperviewEdge(.Left)
        _label.autoPinEdgeToSuperviewEdge(.Right)
        _label.autoAlignAxisToSuperviewAxis(.Vertical)
        _label.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self.view, withOffset: -10)
    }
    
    private func _skinUI() {
        self.view.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.5)
    }
    
}

