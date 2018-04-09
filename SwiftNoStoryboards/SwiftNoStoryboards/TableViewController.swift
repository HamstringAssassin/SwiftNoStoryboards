//
//  TableViewController.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 01/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private let cellReuseIdentifier:String = "cell"
    
    var names = ["Alice","Bob","Michael","Sinead","Lola"]
    
    override func viewDidLoad() {
        self.title = "TableViewController"
        self.registerClassForCell()
    }
    
    func registerClassForCell() {
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        cell?.textLabel?.text = names[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.name = names[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
