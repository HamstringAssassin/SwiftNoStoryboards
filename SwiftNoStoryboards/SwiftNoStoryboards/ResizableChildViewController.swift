//
//  ResizableChildViewController.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 06/10/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import UIKit

private extension Selector {
    static let _collapseButtonPressed = #selector(ResizableChildViewController._collapseButtonPressed(sender:))
}

class ResizableChildViewController: UIViewController {
    
    private var _stackView: UIStackView! {
        didSet {
            _stackView.axis = .vertical
            _stackView.distribution = .fill
            _stackView.alignment = .fill
            
        }
    }
    
    private var _collapseButton: UIButton! {
        didSet {
            _collapseButton.addTarget(self, action: ._collapseButtonPressed, for: .touchUpInside)
            _collapseButton.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
            _collapseButton.setTitle("X", for: .normal)
        }
    }
    
    private var _title: UILabel! {
        didSet {
            _title.text = "A title"
            _title.textAlignment = .left
            _title.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
        }
    }
    
    private var _body: UILabel! {
        didSet {
            _body.numberOfLines = 0
            _body.text = "Some Body Text over\n more than one line"
            _body.textAlignment = .center
            _body.backgroundColor = UIColor.red.withAlphaComponent(0.5)
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
        _collapseButton.autoSetDimension(.height, toSize: 24)
        _collapseButton.autoSetDimension(.width, toSize: 24)
        _collapseButton.autoPinEdge(toSuperviewEdge: .right)
        _collapseButton.autoPinEdge(toSuperviewEdge: .top)
        
        titleContainerView.addSubview(_title)
        _title.autoPinEdge(toSuperviewEdge: .left)
        _title.autoPinEdge(.right, to: .left, of: _collapseButton)
        _title.autoAlignAxis(.horizontal, toSameAxisOf: _collapseButton)
        
        let rulerView = UIView(forAutoLayout: ())
        rulerView.backgroundColor = UIColor.gray
        titleContainerView.addSubview(rulerView)
        
        rulerView.autoSetDimension(.height, toSize: 1)
        rulerView.autoPinEdge(.top, to: .bottom, of: _collapseButton, withOffset: 5)
        rulerView.autoAlignAxis(toSuperviewAxis: .vertical)
        rulerView.autoPinEdge(toSuperviewEdge: .left)
        rulerView.autoPinEdge(toSuperviewEdge: .right)
        
        _stackView.addArrangedSubview(_body)
        _body.autoPinEdge(.top, to: .bottom, of: rulerView, withOffset: 5)
        _body.autoPinEdge(toSuperviewEdge: .left)
        _body.autoPinEdge(toSuperviewEdge: .right)
    }
    
    private func _skinUI() {
        self.view.backgroundColor = UIColor.white
    }
}

extension ResizableChildViewController {
    @objc fileprivate func _collapseButtonPressed(sender: UIButton) {
        print("Button Pressed")
        self._open = !_open
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let welf = self else { return }
            welf._body.isHidden = !welf._open
        }
    }
}
