//
//  PersistedTableViewController.swift
//  SimplePersistenceExample
//
//  Created by Jason Hoffman on 5/28/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

import UIKit

let CellIdentifier = "StuffCell"

class PersistedTableViewController: UITableViewController {
    
    var stuffArray = [Stuff]()
    let store = StuffStore.sharedStore

    override func viewDidLoad() {
        super.viewDidLoad()
        println("viewDidLoad")
    }
    
    
    override func viewWillAppear(animated: Bool) {
        if let ar = store.allStuff() as? [Stuff] {
            self.stuffArray = ar
        }
        
        // Update tableview when new item is added
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return number of items in stuffArray
        return self.stuffArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = self.stuffArray[indexPath.row].stuffName
        cell.imageView?.image = self.stuffArray[indexPath.row].stuffImage
        
        return cell
    }
}
