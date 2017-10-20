//
//  UpdatingSecondChildViewController.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 19/10/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import UIKit

class UpdatingSecondChildViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Log("")
        _createUI()
        _layoutUI()
        _skinUI()
    }
    
    private func _createUI() {
        self._collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    private func _layoutUI() {
        self.view.addSubview(_collectionView)
        _collectionView.autoPinEdgeToSuperviewEdge(.Top)
        _collectionView.autoAlignAxisToSuperviewAxis(.Vertical)
        //        _collectionView.autoPinEdgeToSuperviewEdge(.Left)
        //        _collectionView.autoPinEdgeToSuperviewEdge(.Right)
        _collectionView.autoSetDimension(.Width, toSize: UIScreen.percentage(1.0))
        
        //        _collectionView.autoAlignAxisToSuperviewAxis(.Vertical)
        //        _collectionView.autoAlignAxisToSuperviewAxis(.Horizontal)
        //        NSLayoutConstraint.autoSetPriority(UILayoutPriorityFittingSizeLevel) {
        collectionViewHeightConstraint = _collectionView.autoSetDimension(.Height, toSize: 10)
        //        }
        self.view.layoutIfNeeded()
    }
    
    private func _skinUI() {
    }
}

extension UpdatingSecondChildViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! UpdatingCell
        return cell
    }
}

extension UpdatingSecondChildViewController {
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        Log("")
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        Log("")
        let value = _collectionView.collectionViewLayout.collectionViewContentSize().height
        Log("\(value)")
        collectionViewHeightConstraint?.constant = value
        Log("\(collectionViewHeightConstraint?.constant)")
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
