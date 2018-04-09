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
            _collectionView.backgroundColor = UIColor.clear
            _collectionView.dataSource = self
            _collectionView.delegate = self
            
            _collectionView.register(UpdatingCell.self, forCellWithReuseIdentifier: "cell")
            
            let flow = _collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            
            flow.scrollDirection = .vertical
            flow.estimatedItemSize = CGSize(width: UIScreen.percentage(multiplier: 0.8), height: 10)
        }
    }
    
    override func loadView() {
        _createUI()
        _addUI()
        self.view.setNeedsUpdateConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Log(string: "")
        _skinUI()
    }
    
    override func updateViewConstraints() {
        _layoutUI()
        
        let value = _collectionView.collectionViewLayout.collectionViewContentSize.height
        Log(string: "\(value)")
        collectionViewHeightConstraint?.constant = value
        
        super.updateViewConstraints()
    }
    
    private func _createUI() {
        self.view = UIView()
        self._collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    private func _addUI() {
        self.view.addSubview(_collectionView)
    }
    
    private func _layoutUI() {
        _collectionView.autoPinEdge(toSuperviewEdge: .top)
        _collectionView.autoAlignAxis(toSuperviewAxis: .vertical)
        _collectionView.autoPinEdge(toSuperviewEdge: .bottom)
        _collectionView.autoSetDimension(.width, toSize: UIScreen.percentage(multiplier: 1.0))
        
        collectionViewHeightConstraint = _collectionView.autoSetDimension(.height, toSize: 10, relation: .greaterThanOrEqual)

        self.view.layoutIfNeeded()
    }
    
    private func _skinUI() {
    }
}

extension UpdatingSecondChildViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UpdatingCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return _sizeForItemAtIndexPath(indexPath: indexPath)
    }
    
    private func _sizeForItemAtIndexPath(indexPath: IndexPath) -> CGSize{
        let prototype = UpdatingCell.prototype
        let size = (prototype as UICollectionViewCell).systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        return size
    }
}

extension UpdatingSecondChildViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Log(string: "")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        Log(string: "")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Log(string: "")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Log(string: "")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Log(string: "")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        Log(string: "")
    }
}
