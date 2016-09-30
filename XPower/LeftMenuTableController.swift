//
//  LeftMenuTableController.swift
//  BMWDealerApp
//
//  Created by hua on 7/7/16.
//  Copyright © 2016 SoftwareMerchant. All rights reserved.
//

import UIKit
import Parse

class LeftMenuTableController: UITableViewController {
    
    let currUser = PFUser.currentUser()
    
    
    var leftSideMenuNames = ["Home", "Inventory", "Calendar", "Service", "Garage", "Settings", "About", "Logout"]
    
    var leftSideGuestMenuNames = ["Home", "Inventory", "Calendar", "Service", "Garage", "About", "Go to Login"]


    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        if PFUser.currentUser() == nil || currUser!.username == "guest"{
        
            leftSideMenuNames = leftSideGuestMenuNames
        
        }
        
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
        return leftSideMenuNames.count
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        let imageView = UIImageView(image: UIImage(named: "stars"))
        imageView.frame = self.tableView.bounds
        tableView.backgroundView = imageView
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("leftmenucell", forIndexPath: indexPath)
        
        cell.textLabel?.text = leftSideMenuNames[indexPath.row]
        
        cell.textLabel?.textAlignment = .Left
        
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 18)

        cell.backgroundColor = UIColor.clearColor()
        // Configure the cell...

        return cell
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
             openController("Home")
        case 1:
             openController(leftSideMenuNames[1])
        case 2:
            openController(leftSideMenuNames[2])
        case 3:
            openController(leftSideMenuNames[3])
        case 4:
            openController(leftSideMenuNames[4])
        case 5:
            openController(leftSideMenuNames[5])
        case 6:
            if(PFUser.currentUser() == nil)
            {
                self.openController("Login")
                return 
            }
            else if currUser!.username == "guest"
            {
                PFUser.logOut()
                self.openController("Login")

                return
            }
            openController(leftSideMenuNames[6])
        
        default:
            PFUser.logOut()
            self.openController("Login")
        }
        
        
//        [tableView deselectRowAtIndexPath:indexPath animated:YES];
//        
//        switch (indexPath.row) {
//        case 0:
//            [self openController:_controllerNames[0]];
//            break;
//            
//        case 1:
//            [self openController:_controllerNames[1]];
//            break;
//            
//        case 2:
//            [self openController:_controllerNames[2]];
//            break;
//            
//        case 3:
//            [self openController:_controllerNames[3]];
//            break;
//            
//        case 4:
//            [self openController:_controllerNames[4]];
//            break;
//            
//        case 5:
//            [self openController:_controllerNames[5]];
//            break;
//            
//        case 6:
//            [self openControllerFromAnotherStoryBoard:_controllerNames[6]];
//            break;
//        case 7:
//            [PFUser logOut];
//            [[GIDSignIn sharedInstance] signOut];
//            [[GIDSignIn sharedInstance] disconnect];
//            [self openController:@"Login"];
//            break;
//        default:
//            break;
//        }

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
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
