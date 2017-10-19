//
//  ResizableChildViewController.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 06/10/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import UIKit

private extension Selector {
    static let _collapseButtonPressed = #selector(ResizableChildViewController._collapseButonPressed(_:))
}

class ResizableChildViewController: UIViewController {
    
    private var _stackView: UIStackView! {
        didSet {
            _stackView.axis = .Vertical
            _stackView.distribution = .Fill
            _stackView.alignment = .Fill
            
        }
    }
    
    private var _collapseButton: UIButton! {
        didSet {
            _collapseButton.addTarget(self, action: ._collapseButtonPressed, forControlEvents: .TouchUpInside)
            _collapseButton.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
            _collapseButton.setTitle("X", forState: .Normal)
        }
    }
    
    private var _title: UILabel! {
        didSet {
            _title.text = "A title"
            _title.textAlignment = .Left
            _title.backgroundColor = UIColor.yellowColor().colorWithAlphaComponent(0.5)
        }
    }
    
    private var _body: UILabel! {
        didSet {
            _body.numberOfLines = 0
            _body.text = "Some Body Text over\n more than one line"
            _body.textAlignment = .Center
            _body.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.5)
        }
    }
    
//    private var _bodyHeightConstraint: NSLayoutConstraint?
//    private var _originalBodyHeight: CGFloat = 0.0
    
    private var _open: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _createUI()
        _layoutUI()
        _skinUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        _collapseButton.layer.cornerRadius = max(_collapseButton.frame.height/2, _collapseButton.frame.width/2)
    }
    
    private func _createUI() {
        self._stackView = UIStackView(forAutoLayout: ())
        self._collapseButton = UIButton(forAutoLayout: ())
        self._title = UILabel(forAutoLayout: ())
        self._body = UILabel(forAutoLayout: ())
    }
    
    private func _layoutUI() {
        
        self.view.addSubview(_stackView)
        _stackView.autoPinEdgesToSuperviewEdges()
        let titleContainerView = UIView(forAutoLayout: ())
        
        _stackView.addArrangedSubview(titleContainerView)
        
        titleContainerView.addSubview(_collapseButton)
        _collapseButton.autoSetDimension(.Height, toSize: 24)
        _collapseButton.autoSetDimension(.Width, toSize: 24)
        _collapseButton.autoPinEdgeToSuperviewEdge(.Right)
        _collapseButton.autoPinEdgeToSuperviewEdge(.Top)
        
        titleContainerView.addSubview(_title)
        _title.autoPinEdgeToSuperviewEdge(.Left)
        _title.autoPinEdge(.Right, toEdge: .Left, ofView: _collapseButton)
        _title.autoAlignAxis(.Horizontal, toSameAxisOfView: _collapseButton)
        
        let rulerView = UIView(forAutoLayout: ())
        rulerView.backgroundColor = UIColor.grayColor()
        titleContainerView.addSubview(rulerView)
        
        rulerView.autoSetDimension(.Height, toSize: 1)
        rulerView.autoPinEdge(.Top, toEdge: .Bottom, ofView: _collapseButton, withOffset: 5)
        rulerView.autoAlignAxisToSuperviewAxis(.Vertical)
        rulerView.autoPinEdgeToSuperviewEdge(.Left)
        rulerView.autoPinEdgeToSuperviewEdge(.Right)
        
        _stackView.addArrangedSubview(_body)
        _body.autoPinEdge(.Top, toEdge: .Bottom, ofView: rulerView, withOffset: 5)
        _body.autoPinEdgeToSuperviewEdge(.Left)
        _body.autoPinEdgeToSuperviewEdge(.Right)
    }
    
    private func _skinUI() {
        self.view.backgroundColor = UIColor.whiteColor()
    }
}

extension ResizableChildViewController {
    @objc private func _collapseButonPressed(sender: UIButton) {
        print("Button Pressed")
        self._open = !_open
        UIView.animateWithDuration(0.5) { [weak self] in
            guard let welf = self else { return }
            welf._body.hidden = !welf._open
        }
    }
}
