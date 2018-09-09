//
//  ArticleViewController.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 13/08/2018.
//  Copyright © 2018 Alan O'Connor. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    var articleView: UIView!
    
    var articleLabel: UILabel! {
        didSet {
            articleLabel.text = "Im a label"
        }
    }
    
    var collectionView: UICollectionView! {
        didSet {
            collectionView.register(QuestionCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            collectionView.delegate = self
            collectionView.dataSource = self
            
            let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        layoutUI()
    }
    
    func createUI() {
       self.articleView = UIView()
        self.articleLabel = UILabel()
    }
    
    func layoutUI() {
        self.view.addSubview(articleView)
        self.articleView.addSubview(articleLabel)
        
        self.view.addSubview(collectionView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ArticleViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! QuestionCollectionViewCell
        cell.label.text = "TextLabel: \(indexPath.item)"
        return cell
    }
    
    
}
