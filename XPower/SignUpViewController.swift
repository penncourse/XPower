//
//  SignUpViewController.swift
//  XPower
//
//  Created by hua on 9/7/16.
//  Copyright © 2016 SoftwareMerchant. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var signupName: UITextField!
    @IBOutlet weak var signupEmail: UITextField!
    
    
    @IBOutlet weak var signupPassword: UITextField!
    
    @IBOutlet weak var signupReenterPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitAction(sender: AnyObject) {
        
        let userName = self.signupName.text
        let userEmail = self.signupEmail.text
        
        let password = self.signupPassword.text
        let reenteredpassword = self.signupReenterPassword.text
        
        
        if(userName?.characters.count == 0) {
            
            UIAlertView.init(title: "Error", message: "Username can not be empty", delegate: nil, cancelButtonTitle: "OK")
            return
            
        }else if(userEmail?.characters.count == 0){
            UIAlertView.init(title: "Error", message: "Email can not be empty", delegate: nil, cancelButtonTitle: "OK")
            return
        }else if(password != reenteredpassword && password?.characters.count < 1){
            
            UIAlertView.init(title: "Error", message: "Password and Reentered is not same", delegate: nil, cancelButtonTitle: "OK")
            
            self.signupPassword.text = ""
            self.signupReenterPassword.text = ""
            
            return
            
        }else {
            
            let newUser = PFUser()
            
            newUser.username = userName
            newUser.email = userEmail
            newUser.password = password
            
            
            newUser.signUpInBackgroundWithBlock({ (succeeded: Bool, error:NSError?) in
                
                if((error) != nil){
                    
                    let alertView = UIAlertView.init(title:"Error", message:error?.localizedDescription , delegate: self, cancelButtonTitle: "OK")
                    
                    alertView.show()
                    alertView.tag = 19
                    
                }else{
                    
                    
                    let alertView = UIAlertView.init(title:"Success", message:"You have signed up", delegate: self, cancelButtonTitle: "Go to home")
                    
                    alertView.show()
                    
                    
                    // dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), {
                    
                    //   })
                    
                    
                }
                
                
                
            })

            
            
        }
  
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.signupName.resignFirstResponder()
        self.signupPassword.resignFirstResponder()
        self.signupEmail.resignFirstResponder()
        self.signupReenterPassword.resignFirstResponder()
    }

    
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if alertView.tag == 19 {
            
            signupName.text = ""
            signupReenterPassword.text = ""
            signupEmail.text = ""
            signupPassword.text = ""
            
            return
        }
        
        if buttonIndex == 0 {
            
            dispatch_async(dispatch_get_main_queue(), {
                
                let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("homescreen")
                
                self.navigationController?.pushViewController(viewController!, animated: true)

            })
            
            
        }
        
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
