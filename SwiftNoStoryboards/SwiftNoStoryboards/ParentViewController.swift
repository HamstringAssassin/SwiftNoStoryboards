//
//  ParentViewController.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 16/09/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import UIKit
import PureLayout

class ParentViewController: UIViewController {
    
    private var _scrollView: UIScrollView! {
        didSet {
            
        }
    }
    
    private var _precedingContainerView: UIView! {
        didSet {
            _precedingContainerView.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.5)
        }
    }
    
    private var _containerView: UIView! {
        didSet {
            _containerView.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.5)
        }
    }
    
    private var _procedingContainerView: UIView! {
        didSet {
            _procedingContainerView.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.5)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad")
        _createUI()
        _layoutUI()
        _updateContainerView()
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
        _scrollView = UIScrollView(forAutoLayout: ())
        _precedingContainerView = UIView(forAutoLayout: ())
        _containerView = UIView(forAutoLayout: ())
        _procedingContainerView = UIView(forAutoLayout: ())
    }
    
    private func _layoutUI() {
        self.view.addSubview(_scrollView)
        _scrollView.autoPinEdgesToSuperviewEdges()
        let contentView = UIView(forAutoLayout: ())
        _scrollView.addSubview(contentView)
        contentView.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.5)
        contentView.autoPinEdgesToSuperviewEdges()
        NSLayoutConstraint.autoSetPriority(UILayoutPriorityDefaultLow) { 
            contentView.autoSetDimension(.Height, toSize: view.frame.height)
        }
        
        contentView.autoSetDimension(.Width, toSize: view.frame.width)
        
        contentView.addSubview(_precedingContainerView)
        _precedingContainerView.autoSetDimension(.Height, toSize: 10)//, relation: .GreaterThanOrEqual)
        _precedingContainerView.autoSetDimension(.Width, toSize: 10)//, relation: .GreaterThanOrEqual)
        _precedingContainerView.autoAlignAxisToSuperviewAxis(.Vertical)
        _precedingContainerView.autoPinEdge(.Top, toEdge: .Top, ofView: contentView, withOffset: 10)
        
        contentView.addSubview(_containerView)
        _containerView.autoPinEdge(.Top, toEdge: .Bottom, ofView: _precedingContainerView, withOffset: 10)
        NSLayoutConstraint.autoSetPriority(UILayoutPriorityDefaultLow) { 
            _containerView.autoSetDimension(.Height, toSize: 10)//, relation: .GreaterThanOrEqual)
            _containerView.autoSetDimension(.Width, toSize: 10)//, relation: .GreaterThanOrEqual)
        }
        
        _containerView.autoAlignAxisToSuperviewAxis(.Vertical)
        
        contentView.addSubview(_procedingContainerView)
        _procedingContainerView.autoSetDimension(.Height, toSize: 10)//, relation: .GreaterThanOrEqual)
        _procedingContainerView.autoSetDimension(.Width, toSize: 10)//, relation: .GreaterThanOrEqual)
        _procedingContainerView.autoAlignAxisToSuperviewAxis(.Vertical)
        _procedingContainerView.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: contentView, withOffset: -10)
        
        _containerView.autoPinEdge(.Bottom, toEdge: .Top, ofView: _procedingContainerView, withOffset: -10)
        
    }
    
    private func _updateContainerView() {
        let childControllerView = ChildViewController()
        self.embedViewController(childControllerView, inView: _precedingContainerView)
    }
    
    private func _updatePreceedingContainerView() {
        let childControllerView = ChildViewController()
        self.embedViewController(childControllerView, inView: _containerView)
    }
    
    private func _updateProceedingContainerView() {
        let childControllerView = ChildViewController()
        self.embedViewController(childControllerView, inView: _procedingContainerView)
    }
    
    private func _skinUI() {
        self.view.backgroundColor = UIColor.whiteColor()
    }
}

extension UIViewController {
    
    public func embedViewController(viewController: UIViewController, inView: UIView){
        self.addChildViewController(viewController)
        inView.addSubview(viewController.view)
        viewController.view.autoPinEdgesToSuperviewEdges()
        viewController.didMoveToParentViewController(self)
    }
}

