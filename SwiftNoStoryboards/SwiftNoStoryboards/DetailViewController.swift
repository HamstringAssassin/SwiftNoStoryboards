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
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
