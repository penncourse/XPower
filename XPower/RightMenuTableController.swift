//
//  RightMenuTableController.swift
//  BMWDealerApp
//
//  Created by hua on 7/7/16.
//  Copyright © 2016 SoftwareMerchant. All rights reserved.
//

import UIKit

class RightMenuTableController: UITableViewController, UIAlertViewDelegate {
    
    let rigthMenuNames = ["Home Screen", "Add Friend", "Friends List", "Friend Requests"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None;


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let img = UIImage(named: "rightmenubackground")
        
        let imageView = UIImageView.init(image: img!)
        
        imageView.frame = self.view.bounds
        
        imageView.alpha = 1
        
        self.view.addSubview(imageView)
        
        self.view.sendSubviewToBack(imageView)
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rigthMenuNames.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("rightmenucell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel!.text = rigthMenuNames[indexPath.row]
        
        cell.textLabel?.textAlignment = .Left
        
        cell.textLabel?.textColor = UIColor.blackColor()
        
       
        
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 24)
        
        
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 100.0
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let imageView = UIImageView(image: UIImage(named: "stars"))
        imageView.frame = self.tableView.bounds
        tableView.backgroundView = imageView
    }
    
    
    func openController(controllerName:String) {
        
        let viewController = storyboard?.instantiateViewControllerWithIdentifier(controllerName)
        //        let mainNavigationController = storyboard?.instantiateViewControllerWithIdentifier("mainController") as! UINavigationController
        self.navigationController!.pushViewController(viewController!, animated: true)
        
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row {
        case 0:
            openController("homescreen")
        case 1:
            
            openController("addFriend")
        case 2:

            openController("friends")
            
        case 3:
            openController("invitation")
        
            
        default:
             break
        }
        
        
    }
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
