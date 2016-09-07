//
//  LoginViewController.swift
//  XPower
//
//  Created by hua on 9/7/16.
//  Copyright © 2016 SoftwareMerchant. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    var loginName:String?
    var loginPassword:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    @IBAction func loginAction(sender: AnyObject) {
        
        if(self.userName.text?.characters.count > 0 && self.password.text?.characters.count > 0){
            loginName = self.userName.text
            loginPassword = self.password.text
            
            
            dispatch_async(dispatch_get_main_queue()){
                
                
                PFUser.logInWithUsernameInBackground(self.loginName!, password: self.loginPassword!){
                    
                    (user:PFUser?, error:NSError?)->Void in
                    
                    if(user != nil){
                        dispatch_async(dispatch_get_main_queue()){
                            
                            let userDefaults = NSUserDefaults.standardUserDefaults()
                            
                            userDefaults.setObject(self.loginPassword, forKey: "loginPwd")
                            userDefaults.setObject(self.loginName, forKey: "username")
                            
                            
                            
                            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("homescreen")
                            
                            self.navigationController?.pushViewController(viewController, animated: true)
                        }
                    }else{
                        
                        let alertView = UIAlertView.init(title: "Error", message: error?.localizedDescription, delegate: self, cancelButtonTitle: "OK")
                        alertView.show()
                    }
                    
                }
                
                
                self.userName.text = ""
                self.password.text = ""
                
            }

        }
  
        
    }
    
    
    
    
    

}
