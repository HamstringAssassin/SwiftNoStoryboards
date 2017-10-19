//
//  UpdatingParentViewController.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 19/10/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import UIKit

class UpdatingParentViewController: UIViewController {
    
    private var _scrollView: UIScrollView!
    
    private var _firstContainerView: UIView!
    
    private var _secondContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad")
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
        
    }
    
    private func _skinUI() {
        
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
}
