//
//  PointsViewController.swift
//  XPower
//
//  Created by hua on 9/7/16.
//  Copyright © 2016 SoftwareMerchant. All rights reserved.
//

import UIKit

class PointsViewController: UIViewController {
    @IBOutlet weak var pointstableview: UITableView!

    @IBOutlet weak var obtainedtableview: UITableView!
    
    static let pointsViewControllerSharedInstance = PointsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PointsTableViewController.sharedPointsTableViewControllerInstance.pointsviewController = self

        pointstableview.delegate = PointsTableViewController.sharedPointsTableViewControllerInstance
        
        pointstableview.dataSource = PointsTableViewController.sharedPointsTableViewControllerInstance
        
        
        ObtainedPointsTableViewController.obtainedPointsTableViewControllerSharedInstance.pointsViewController = self
        
        
        obtainedtableview.delegate = ObtainedPointsTableViewController.obtainedPointsTableViewControllerSharedInstance
        
        obtainedtableview.dataSource = ObtainedPointsTableViewController.obtainedPointsTableViewControllerSharedInstance
        
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
