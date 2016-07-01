//
//  DetailViewController.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 01/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var name:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = name
        self.title = name
    }
}
