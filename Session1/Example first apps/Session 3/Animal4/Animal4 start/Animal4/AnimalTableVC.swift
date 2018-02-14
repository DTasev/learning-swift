//
//  AnimalTableVC.swift
//  Animal1
//
//  Created by Chris Price on 13/06/2016.
//  Copyright © 2016 Chris Price. All rights reserved.
//

import UIKit

class AnimalTableVC: UITableViewController {

    var categories = ["Dogs", "Cats", "Rabbits" ]
    
    var categoryItems = [ [ "Collie", "Labrador", "Dalmation", "Doberman", "Afghan"],
                          [ "Siamese", "Manx", "Persian"],
                          [  "Dutch", "Chinchilla", "Lionhead"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return categories.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryItems[section].count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AnimalCell", forIndexPath: indexPath)
        
        cell.textLabel!.text = categoryItems[indexPath.section][indexPath.row]
        
        switch indexPath.section {
        case 0: cell.backgroundColor = UIColor.yellowColor()
        case 1: cell.backgroundColor = UIColor.purpleColor()
        default: cell.backgroundColor = UIColor.greenColor()
        }
        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailVC = segue.destinationViewController as! AnimalDetailVC
                detailVC.valueForLabel = categoryItems[indexPath.section][indexPath.row]
            }
        }
    }
 

}
