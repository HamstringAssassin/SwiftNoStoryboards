//
//  UpdatingParentViewController.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 19/10/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import UIKit
import ReactiveCocoa
import enum Result.NoError

protocol UpdatingParentViewControllerDelegate: class {
    func updatingParentViewControllerEmbedUpdatingFirstViewController(viewController: UpdatingParentViewController) -> UpdatingFirstChildViewController
    func updatingParentViewControllerEmbedUpdatingSecondViewController(viewController: UpdatingParentViewController) -> UpdatingSecondChildViewController
}

class UpdatingParentViewController: UIViewController {
    
    private var _scrollView: UIScrollView!
    
    private var _contentView: UIView! {
        didSet {
        }
    }
    
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
    
    private weak var _delgate: UpdatingParentViewControllerDelegate?
    
    convenience init(delegate: UpdatingParentViewControllerDelegate?) {
        self.init()
        self._delgate = delegate
    }
    
    override func loadView() {
        _createUI()
        _addUI()
        Log("")
    }
    
    var didSetupConstraints = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _configureFirstViewController()
        _configureSecondViewController()
        _skinUI()
    }
    
    private func _createUI() {
        self.view = UIView()
        self._scrollView = UIScrollView(forAutoLayout: ())
        self._contentView = UIView(forAutoLayout: ())
        self._firstContainerView = UIView(forAutoLayout: ())
        self._secondContainerView = UIView(forAutoLayout: ())
    }
    
    
    private func _addUI() {
        self.view.addSubview(_scrollView)
        _setupScrollView(_scrollView)

        self.view.setNeedsUpdateConstraints()
    }
    
    private func _setupScrollView(scrollView: UIScrollView) {
        
        _scrollView.addSubview(_contentView)
        _contentView.addSubview(_firstContainerView)
        _contentView.addSubview(_secondContainerView)
    }

    override func updateViewConstraints() {
        if !didSetupConstraints {
            _layoutUI()
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }

    
    private func _layoutUI() {
        _scrollView.autoPinEdgesToSuperviewEdges()
        _scrollView.autoCenterInSuperview()
        
        _contentView.autoPinEdgesToSuperviewEdges()
        _contentView.autoAlignAxisToSuperviewAxis(.Vertical)
        _contentView.autoMatchDimension(.Width, toDimension: .Width, ofView: view)
        NSLayoutConstraint.autoSetPriority(UILayoutPriorityDefaultLow) { 
            _contentView.autoSetDimension(.Height, toSize: view.frame.height)
        }
        
        _firstContainerView.autoPinEdgeToSuperviewEdge(.Top, withInset: 10)
        _firstContainerView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        _firstContainerView.autoPinEdgeToSuperviewEdge(.Right, withInset: 0)
        _firstContainerView.autoAlignAxisToSuperviewAxis(.Vertical)

        _secondContainerView.autoPinEdge(.Top, toEdge: .Bottom, ofView: _firstContainerView, withOffset: 10)
        _secondContainerView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        _secondContainerView.autoPinEdgeToSuperviewEdge(.Right, withInset: 0)
        _secondContainerView.autoPinEdgeToSuperviewEdge(.Bottom)
        _secondContainerView.autoAlignAxisToSuperviewAxis(.Vertical)
    }

    override func preferredContentSizeDidChangeForChildContentContainer(container: UIContentContainer) {
        Log("")
    }
    
    private func _skinUI() {
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    private func _configureFirstViewController() {
        guard let firstUpdatingViewController = _delgate?.updatingParentViewControllerEmbedUpdatingFirstViewController(self) else { return }
        self.embedViewController(firstUpdatingViewController, inView: _firstContainerView)
    }
    
    private func _configureSecondViewController() {
        guard let secondUpdatingViewController = _delgate?.updatingParentViewControllerEmbedUpdatingSecondViewController(self) else { return }
        self.embedViewController(secondUpdatingViewController, inView: _secondContainerView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        Log("\(_scrollView.frame.height)")
        Log("\(_scrollView.contentSize)")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        Log("\(_scrollView.frame.height)")
        Log("\(_scrollView.contentSize)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Log("\(_scrollView.frame.height)")
        Log("\(_scrollView.contentSize)")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        Log("\(_scrollView.frame.height)")
        Log("\(_scrollView.contentSize)")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        Log("\(_scrollView.frame.height)")
        Log("\(_scrollView.contentSize)")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        Log("\(_scrollView.frame.height)")
        Log("\(_scrollView.contentSize)")
    }
}
