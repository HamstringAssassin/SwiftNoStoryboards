//
//  UpdatingFirstChildViewController.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 19/10/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import UIKit
import ReactiveSwift
import enum Result.NoError

class UpdatingFirstChildViewController: UIViewController {
    
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
    
    private var _viewModelProperty = MutableProperty<UpdatingFirstChildViewModel?>(nil)
    
    func bindViewModel(producer: SignalProducer<UpdatingFirstChildViewModel, Result.NoError>) {
        _viewModelProperty <~ producer.map { $0 }.observe(on: UIScheduler())
        _viewModelProperty.producer.startWithValues { (viewModel) in
            self._updateUI(viewModel: viewModel)
        }
    }
    
    override func loadView() {
        _createUI()
        _addUI()
        view.setNeedsUpdateConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _layoutUI()
        Log(string: "")
        _skinUI()
    }
    
    override func updateViewConstraints() {
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
        _collectionView.autoPinEdge(toSuperviewEdge: .bottom)
        _collectionView.autoAlignAxis(toSuperviewAxis: .vertical)
        _collectionView.autoSetDimension(.width, toSize: UIScreen.percentage(multiplier: 1.0))
        
        collectionViewHeightConstraint = _collectionView.autoSetDimension(.height, toSize: 10, relation: .greaterThanOrEqual)
        
        self.view.layoutIfNeeded()
    }
    
    private func _skinUI() {
    }
    
    private func _updateUI(viewModel: UpdatingFirstChildViewModel?) {
        guard isViewLoaded else { return }
        _collectionView.reloadData()
        self.updateViewConstraints()
    }
}

extension UpdatingFirstChildViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _viewModelProperty.value?.dataSource.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UpdatingCell
        cell.viewModel = _viewModelProperty.value?.dataSource[indexPath.row]
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


extension UpdatingFirstChildViewController {
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
