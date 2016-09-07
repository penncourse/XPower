//
//  HomeScreenViewController.swift
//  XPower
//
//  Created by hua on 9/7/16.
//  Copyright © 2016 SoftwareMerchant. All rights reserved.
//

import UIKit
import Parse

class HomeScreenViewController: UIViewController {

    
    @IBOutlet weak var pointsbutton: UIButton!
    @IBOutlet weak var pointslabel: UILabel!
    @IBOutlet weak var logoutlabel: UILabel!
    @IBOutlet weak var logoutbutton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.pointsbutton.layer.borderWidth = 1
        self.pointsbutton.layer.borderColor = UIColor.whiteColor().CGColor
        self.pointsbutton.layer.cornerRadius = self.pointsbutton.layer.bounds.size.width/2
        self.pointsbutton.layer.masksToBounds = true
        
        
        let pointsImageView = UIImageView.init(frame: CGRectMake(0, 0, 35, 35))
        pointsImageView.image = UIImage(named: "points")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        
        pointsImageView.center = CGPointMake(self.pointsbutton.frame.size.width/2, self.pointsbutton.frame.size.height/2)
        
        pointsImageView.tintColor = UIColor.blueColor()
        
        self.pointsbutton.addSubview(pointsImageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logout(sender: AnyObject) {
        
        PFUser.logOut()
        self.navigationController!.pushViewController((self.storyboard?.instantiateViewControllerWithIdentifier("firstscreen"))!, animated: true)
        
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
