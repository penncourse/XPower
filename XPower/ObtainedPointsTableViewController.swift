//
//  ObtainedPointsTableViewController.swift
//  XPower
//
//  Created by hua on 9/7/16.
//  Copyright © 2016 SoftwareMerchant. All rights reserved.
//

import UIKit
import Parse
import Firebase
import FirebaseDatabase

class ObtainedPointsTableViewController: UITableViewController {
    var  rootRef:FIRDatabaseReference?
    
    var obtainedPointsArray = [String]()
    static let obtainedPointsTableViewControllerSharedInstance = ObtainedPointsTableViewController()
    
    var pointsViewController: PointsViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return obtainedPointsArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = CustomerCell(frame: CGRectMake(0, 0, self.view.frame.width, 150), title:obtainedPointsArray[indexPath.row], object: self, row:indexPath.row, section:indexPath.section)

        
//           if (tableView.dequeueReusableCellWithIdentifier("obtainedpointscell") == nil){
//                
//                tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "obtainedpointscell")
//                
//            }
//            
//            
//            let cell = tableView.dequeueReusableCellWithIdentifier("obtainedpointscell", forIndexPath: indexPath)

        // Configure the cell...
       // cell.textLabel?.text = obtainedPointsArray[indexPath.row]
        
        cell.backgroundColor = UIColor.clearColor()
        
        cell.textLabel?.font = UIFont.systemFontOfSize(20)

        
        return cell
    }
    
    
    
    class CustomerCell : UITableViewCell {
        
        var cellButton : UIButton!
        var cellLabel : UILabel!
        
        
        var obtainedpointsTableObject: PointsTableViewController!
        
        var sendName:String!
        
        var tableSection:Int?
        
        var tableRow:Int?
        
        init(frame: CGRect, title:String, object:ObtainedPointsTableViewController, row:Int, section: Int) {
            
            super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "invitecell")
            
            
            sendName = title
            
            cellLabel = UILabel(frame : CGRectMake(50, 5, 250, 80))
            
            
            cellLabel.lineBreakMode = .ByWordWrapping
            cellLabel.numberOfLines = 0
            
            cellLabel.textColor = UIColor.whiteColor()
            
            
            
            cellButton = UIButton(frame: CGRectMake(0, 28, 35, 35))
           
            cellButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            
            
            
//            let pointsImageView = UIImageView.init(frame: CGRectMake(0, 0, 35, 35))
//            pointsImageView.image = UIImage(named: "points")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
//            
//            pointsImageView.center = CGPointMake(cellButton.frame.size.width/2, cellButton.frame.size.height/2)
//            
//            pointsImageView.tintColor = UIColor.blueColor()
//            
//            cellButton.addSubview(pointsImageView)
            
            
           let temp = object.obtainedPointsArray[row]
            
            
//          String(PointsTableViewController.sharedPointsTableViewControllerInstance.pointstable[title]))
            cellButton.setTitle(String(PointsTableViewController.sharedPointsTableViewControllerInstance.pointstable[title]!), forState: .Normal)
            
            cellLabel.text = title
            
            tableSection = section
            
            tableRow = row
            
            
            addSubview(cellLabel)
            
            addSubview(cellButton)
            
            
        }
        
        
        
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override init(style: UITableViewCellStyle, reuseIdentifier: String?){
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        }
        
        
        
        
        
        
        
    }

    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
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
