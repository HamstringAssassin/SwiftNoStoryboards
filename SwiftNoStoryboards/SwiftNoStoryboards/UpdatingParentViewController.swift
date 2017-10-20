//
//  UpdatingParentViewController.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 19/10/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import UIKit
import ReactiveCocoa

class UpdatingParentViewController: UIViewController {
    
    private var _scrollView: UIScrollView!
    
    private var _firstContainerView: UIView! {
        didSet {
            _firstContainerView.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.5)
        }
    }
    
    private var _secondContainerView: UIView! {
        didSet {
            _secondContainerView.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.5)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Log("")
        _createUI()
        _layoutUI()
        _skinUI()
    }
    
    private func _createUI() {
        self._scrollView = UIScrollView(forAutoLayout: ())
        self._firstContainerView = UIView(forAutoLayout: ())
        self._secondContainerView = UIView(forAutoLayout: ())
    }
    
    private func _layoutUI() {
        self.view.addSubview(_scrollView)
        _scrollView.autoPinEdgesToSuperviewEdges()
        _setupScrollView(_scrollView)
        
        _firstContainerView.autoPinEdgeToSuperviewEdge(.Top, withInset: 10)
        _firstContainerView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
        _firstContainerView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
        
        _secondContainerView.autoPinEdge(.Top, toEdge: .Bottom, ofView: _firstContainerView, withOffset: 10)
        _secondContainerView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
        _secondContainerView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
    }
    
    private func _setupScrollView(scrollView: UIScrollView) {
        let contentView = UIView(forAutoLayout: ())
        _scrollView.addSubview(contentView)
        contentView.autoPinEdgesToSuperviewEdges()
        contentView.autoSetDimension(.Width, toSize: view.frame.width)
        
        contentView.addSubview(_firstContainerView)
        contentView.addSubview(_secondContainerView)
    }
    
    private func _skinUI() {
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        Log("")
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        Log("")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        Log("")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Log("")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        Log("")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        Log("")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        Log("")
    }
}
