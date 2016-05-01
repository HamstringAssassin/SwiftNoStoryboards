//
//  TableViewController.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 01/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var names = ["Alice","Bob","Michael","Sinead","Lola"]
    
    override func viewDidLoad() {
        self.title = "TableViewController"
        self.registerClassForCell()
    }
    
    func registerClassForCell() {
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        }
    
        let name = names[indexPath.row]
        cell.textLabel?.text = name
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.name = names[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}