//
//  ChooseSchoolViewController.swift
//  XPower
//
//  Created by hua on 9/7/16.
//  Copyright © 2016 SoftwareMerchant. All rights reserved.
//

import UIKit

class ChooseSchoolViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var schoolNames: UITableView!
    
    let schoolNamesArray = ["Haverford", "Agnes Irwin School"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        schoolNames.delegate = self
        schoolNames.dataSource = self

        schoolNames.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        schoolNames.separatorStyle = UITableViewCellSeparatorStyle.None
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = schoolNamesArray[indexPath.row]
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.navigationController?.pushViewController((storyboard?.instantiateViewControllerWithIdentifier("signup"))!, animated: true)
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
