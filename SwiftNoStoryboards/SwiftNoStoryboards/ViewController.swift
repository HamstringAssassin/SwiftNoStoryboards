//
//  ViewController.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 29/04/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main ViewController"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPressTableViewButton(sender: UIButton) {
        let tableViewController = TableViewController()
        navigationController?.pushViewController(tableViewController, animated: true)
    }

    @IBAction func didPressVariableSIzedContainerView(sender: AnyObject) {
        let parentViewController = ParentViewController()
        navigationController?.pushViewController(parentViewController, animated: true)
    }
    
    @IBAction func didPressResizableContainerView(sender: AnyObject) {
        let resizableViewController = ResizableParentViewController()
        navigationController?.pushViewController(resizableViewController, animated: true)
    }
    @IBAction func didPressUpdatingParentViewController(sender: AnyObject) {
        let updatingParentViewController = UpdatingParentViewController()
        navigationController?.pushViewController(updatingParentViewController, animated: true)
    }
}
