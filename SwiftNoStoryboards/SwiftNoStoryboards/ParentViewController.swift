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
            _precedingContainerView.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        }
    }
    
    private var _containerView: UIView! {
        didSet {
            _containerView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        }
    }
    
    private var _procedingContainerView: UIView! {
        didSet {
            _procedingContainerView.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
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
        contentView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
        contentView.autoPinEdgesToSuperviewEdges()
        NSLayoutConstraint.autoSetPriority(UILayoutPriority.defaultLow) {
            contentView.autoSetDimension(.height, toSize: view.frame.height)
        }
        
        contentView.autoSetDimension(.width, toSize: view.frame.width)
        
        contentView.addSubview(_precedingContainerView)
        _precedingContainerView.autoSetDimension(.height, toSize: 10)//, relation: .GreaterThanOrEqual)
        _precedingContainerView.autoSetDimension(.width, toSize: 10)//, relation: .GreaterThanOrEqual)
        _precedingContainerView.autoAlignAxis(toSuperviewAxis: .vertical)
        _precedingContainerView.autoPinEdge(.top, to: .top, of: contentView, withOffset: 10)
        
        contentView.addSubview(_containerView)
        _containerView.autoPinEdge(.top, to: .bottom, of: _precedingContainerView, withOffset: 10)
        NSLayoutConstraint.autoSetPriority(UILayoutPriority.defaultLow) { 
            _containerView.autoSetDimension(.height, toSize: 10)//, relation: .GreaterThanOrEqual)
            _containerView.autoSetDimension(.width, toSize: 10)//, relation: .GreaterThanOrEqual)
        }
        
        _containerView.autoAlignAxis(toSuperviewAxis: .vertical)
        
        contentView.addSubview(_procedingContainerView)
        _procedingContainerView.autoSetDimension(.height, toSize: 10)//, relation: .GreaterThanOrEqual)
        _procedingContainerView.autoSetDimension(.width, toSize: 10)//, relation: .GreaterThanOrEqual)
        _procedingContainerView.autoAlignAxis(toSuperviewAxis: .vertical)
        _procedingContainerView.autoPinEdge(.bottom, to: .bottom, of: contentView, withOffset: -10)
        
        _containerView.autoPinEdge(.bottom, to: .top, of: _procedingContainerView, withOffset: -10)
        
    }
    
    private func _updateContainerView() {
        let childControllerView = ChildViewController()
        self.embedViewController(viewController: childControllerView, inView: _precedingContainerView)
    }
    
    private func _updatePreceedingContainerView() {
        let childControllerView = ChildViewController()
        self.embedViewController(viewController: childControllerView, inView: _containerView)
    }
    
    private func _updateProceedingContainerView() {
        let childControllerView = ChildViewController()
        self.embedViewController(viewController: childControllerView, inView: _procedingContainerView)
    }
    
    private func _skinUI() {
        self.view.backgroundColor = UIColor.white
    }
}

extension UIViewController {
    
    public func embedViewController(viewController: UIViewController, inView: UIView){
        self.addChildViewController(viewController)
        inView.addSubview(viewController.view)
        viewController.view.autoPinEdgesToSuperviewEdges()
        viewController.didMove(toParentViewController: self)
    }
}

