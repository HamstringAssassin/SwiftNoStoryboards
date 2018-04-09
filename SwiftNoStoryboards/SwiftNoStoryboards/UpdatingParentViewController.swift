//
//  UpdatingParentViewController.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 19/10/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import UIKit
import ReactiveSwift
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
            _firstContainerView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        }
    }
    
    private var _secondContainerView: UIView! {
        didSet {
            _secondContainerView.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
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
        Log(string: "")
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
        _setupScrollView(scrollView: _scrollView)

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
        _contentView.autoAlignAxis(toSuperviewAxis: .vertical)
        _contentView.autoMatch(.width, to: .width, of: view)
        NSLayoutConstraint.autoSetPriority(UILayoutPriority.defaultLow) {
            _contentView.autoSetDimension(.height, toSize: view.frame.height)
        }
        
        _firstContainerView.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        _firstContainerView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
        _firstContainerView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
        _firstContainerView.autoAlignAxis(toSuperviewAxis: .vertical)

        _secondContainerView.autoPinEdge(.top, to: .bottom, of: _firstContainerView, withOffset: 10)
        _secondContainerView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
        _secondContainerView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
        _secondContainerView.autoPinEdge(toSuperviewEdge: .bottom)
        _secondContainerView.autoAlignAxis(toSuperviewAxis: .vertical)
    }

    override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        Log(string: "")
    }
    
    private func _skinUI() {
        self.view.backgroundColor = UIColor.white
    }
    
    private func _configureFirstViewController() {
        guard let firstUpdatingViewController = _delgate?.updatingParentViewControllerEmbedUpdatingFirstViewController(viewController: self) else { return }
        self.embedViewController(viewController: firstUpdatingViewController, inView: _firstContainerView)
    }
    
    private func _configureSecondViewController() {
        guard let secondUpdatingViewController = _delgate?.updatingParentViewControllerEmbedUpdatingSecondViewController(viewController: self) else { return }
        self.embedViewController(viewController: secondUpdatingViewController, inView: _secondContainerView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Log(string: "\(_scrollView.frame.height)")
        Log(string: "\(_scrollView.contentSize)")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        Log(string: "\(_scrollView.frame.height)")
        Log(string: "\(_scrollView.contentSize)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Log(string: "\(_scrollView.frame.height)")
        Log(string: "\(_scrollView.contentSize)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Log(string: "\(_scrollView.frame.height)")
        Log(string: "\(_scrollView.contentSize)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Log(string: "\(_scrollView.frame.height)")
        Log(string: "\(_scrollView.contentSize)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        Log(string: "\(_scrollView.frame.height)")
        Log(string: "\(_scrollView.contentSize)")
    }
}
