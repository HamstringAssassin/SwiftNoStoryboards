//
//  ResizableParentViewController.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 06/10/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import UIKit

class ResizableParentViewController: UIViewController {

    private var _childContainerView: UIView! {
        didSet {
            _childContainerView.backgroundColor = UIColor.blueColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _createUI()
        _layoutUI()
        _embedChildViewController()
        _skinUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func _createUI() {
        self._childContainerView = UIView(forAutoLayout: ())
    }
    
    private func _layoutUI() {
        self.view.addSubview(_childContainerView)
        _childContainerView.autoAlignAxisToSuperviewAxis(.Horizontal)
        _childContainerView.autoAlignAxisToSuperviewAxis(.Vertical)
    }
    
    private func _embedChildViewController() {
        let resizableChildViewController = ResizableChildViewController()
        self.embedViewController(resizableChildViewController, inView: _childContainerView)
        _childContainerView.layoutIfNeeded()
    }
    
    private func _skinUI() {
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
}
