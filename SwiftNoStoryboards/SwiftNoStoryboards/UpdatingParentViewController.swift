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
    
    private var _scrollView: UIScrollView! {
        didSet {
        }
    }
    
    private var _contentView: UIView!
    
    private var _firstContainerView: UIView! {
        didSet {
            _firstContainerView.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.5)
        }
    }
    
    private var _secondContainerView: UIView! {
        didSet {
            _secondContainerView.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.5)
        }
    }
    
    override func loadView() {
        _createUI()
        _addUI()
        Log("")
    }
    
    var didSetupConstraints = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Log("")
        _configureFirstViewController()
        _configureSecondViewController()
        _skinUI()
    }
    
    private func _addUI() {
        self.view.addSubview(_scrollView)
        _setupScrollView(_scrollView)

        self.view.setNeedsUpdateConstraints()

    }
    
    private func _createUI() {
        self.view = UIView()
        self._scrollView = UIScrollView(forAutoLayout: ())
        self._firstContainerView = UIView(forAutoLayout: ())
        self._secondContainerView = UIView(forAutoLayout: ())
    }
    
    private func _layoutUI() {
        
        _contentView.autoPinEdgesToSuperviewEdges()
        _contentView.autoMatchDimension(.Width, toDimension: .Width, ofView: view)
        _contentView.autoAlignAxisToSuperviewAxis(.Horizontal)
        _contentView.autoAlignAxisToSuperviewAxis(.Vertical)
        
        _firstContainerView.autoPinEdgeToSuperviewEdge(.Top, withInset: 10)
        _firstContainerView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
        _firstContainerView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
        _firstContainerView.autoAlignAxisToSuperviewAxis(.Vertical)
        
        
//        _firstContainerView.autoSetDimension(.Width, toSize: UIScreen.percentage(1.0))
//        _firstContainerView.autoPinEdgeToSuperviewEdge(.Bottom)
//        NSLayoutConstraint.autoSetPriority(UILayoutPriorityFittingSizeLevel) {
            _firstContainerView.autoSetDimension(.Height, toSize: 0, relation: .GreaterThanOrEqual)
//        }
        
//        _firstContainerView.autoSetDimension(.Height, toSize: 0, relation: .GreaterThanOrEqual)
//        _firstContainerView.autoPinEdgeToSuperviewEdge(.Bottom)
        
//        _firstContainerView.autoSetDimension(.Width, toSize: UIScreen.percentage(1.0))
//        _firstContainerView.autoAlignAxisToSuperviewAxis(.Vertical)
//        _firstContainerView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 0, relation: .GreaterThanOrEqual)
        
        _secondContainerView.autoPinEdge(.Top, toEdge: .Bottom, ofView: _firstContainerView, withOffset: 10)
        
        _secondContainerView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
        _secondContainerView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
        _secondContainerView.autoPinEdgeToSuperviewEdge(.Bottom)
        
    }
    
    private func _setupScrollView(scrollView: UIScrollView) {
        scrollView.autoPinEdgesToSuperviewEdges()

        _contentView = UIView(forAutoLayout: ())
        _scrollView.addSubview(_contentView)
        
//        contentView.autoSetDimension(.Width, toSize: view.frame.width)
//        NSLayoutConstraint.autoSetPriority(UILayoutPriorityDefaultLow) {
//            scrollViewContentHeight = contentView.autoSetDimension(.Height, toSize: view.frame.height, relation: .GreaterThanOrEqual)
//        }
        
        _contentView.addSubview(_firstContainerView)
        _contentView.addSubview(_secondContainerView)
    }
    
    private func _skinUI() {
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    private func _configureFirstViewController() {
        let firstUpdatingViewController = UpdatingFirstChildViewController()
        self.embedViewController(firstUpdatingViewController, inView: _firstContainerView)
//        _firstContainerView.layoutIfNeeded()
        Log("")
    }
    
    private func _configureSecondViewController() {
        let secondUpdatingViewController = UpdatingSecondChildViewController()
        self.embedViewController(secondUpdatingViewController, inView: _secondContainerView)
//        _secondContainerView.layoutIfNeeded()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        Log("")
    }
    
    override func updateViewConstraints() {
//        if !didSetupConstraints {
            _layoutUI()
//        }
        super.updateViewConstraints()

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
//        print("\(_scrollView.hasAmbiguousLayout())") // prints "true"
//        print("\(_scrollView.exerciseAmbiguityInLayout())") // prints "true"
        
    }
}
