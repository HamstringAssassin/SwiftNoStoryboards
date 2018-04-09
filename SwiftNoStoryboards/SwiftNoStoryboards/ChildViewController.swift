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
            _label.textAlignment = .center
            _label.backgroundColor = UIColor.cyan.withAlphaComponent(0.5)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad")
        _createUI()
        _layoutUI()
        _skinUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    private func _createUI() {
        _label = UILabel(forAutoLayout: ())
    }
    
    private func _layoutUI() {
        self.view.addSubview(_label)
        _label.autoPinEdge(.top, to: .top, of: self.view, withOffset: 10)
        _label.autoPinEdge(toSuperviewEdge: .left)
        _label.autoPinEdge(toSuperviewEdge: .right)
        _label.autoAlignAxis(toSuperviewAxis: .vertical)
        _label.autoPinEdge(.bottom, to: .bottom, of: self.view, withOffset: -10)
        self.view.layoutIfNeeded()
    }
    
    private func _skinUI() {
        self.view.backgroundColor = UIColor.green.withAlphaComponent(0.5)
    }
    
}

