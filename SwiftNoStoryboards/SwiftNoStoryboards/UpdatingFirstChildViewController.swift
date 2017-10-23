//
//  UpdatingFirstChildViewController.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 19/10/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import UIKit

class UpdatingFirstChildViewController: UIViewController {
    
    var collectionViewHeightConstraint: NSLayoutConstraint?
    
    private var _collectionView: UICollectionView! {
        didSet {
            _collectionView.backgroundColor = UIColor.clearColor()
            _collectionView.dataSource = self
            _collectionView.delegate = self
            
            _collectionView.registerClass(UpdatingCell.self, forCellWithReuseIdentifier: "cell")
            
            let flow = _collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            
            flow.scrollDirection = .Vertical
            flow.estimatedItemSize = CGSize(width: UIScreen.percentage(0.8), height: 10)
            
        }
    }
    
    override func loadView() {
        _createUI()
        _addUI()
        view.setNeedsUpdateConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Log("")
        _skinUI()
    }
    
    override func updateViewConstraints() {
        _layoutUI()
        
        let value = _collectionView.collectionViewLayout.collectionViewContentSize().height
        Log("\(value)")
        collectionViewHeightConstraint?.constant = value
        
        super.updateViewConstraints()
    }
    
    private func _createUI() {
        self.view = UIView()
        self._collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    private func _addUI() {
        self.view.addSubview(_collectionView)
    }
    
    private func _layoutUI() {
        _collectionView.autoPinEdgeToSuperviewEdge(.Top)
        _collectionView.autoPinEdgeToSuperviewEdge(.Bottom)
        _collectionView.autoAlignAxisToSuperviewAxis(.Vertical)
        _collectionView.autoSetDimension(.Width, toSize: UIScreen.percentage(1.0))
        
        collectionViewHeightConstraint = _collectionView.autoSetDimension(.Height, toSize: 10, relation: .GreaterThanOrEqual)
        
        self.view.layoutIfNeeded()
    }
    
    
    override var preferredContentSize: CGSize {
        get {
            return _collectionView.collectionViewLayout.collectionViewContentSize()
        }
        set {
            self.preferredContentSize = newValue
        }
        
    }
    
    private func _skinUI() {
//        self.view.backgroundColor = UIColor.whiteColor()
    }
}

extension UpdatingFirstChildViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! UpdatingCell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return _sizeForItemAtIndexPath(indexPath)
    }
    
    private func _sizeForItemAtIndexPath(indexPath: NSIndexPath) -> CGSize{
        let prototype = UpdatingCell.prototype
        let size = (prototype as UICollectionViewCell).systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
        return size
    }
}


extension UpdatingFirstChildViewController {
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
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
