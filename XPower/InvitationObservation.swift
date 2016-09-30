//
//  InvitationObservation.swift
//  XPower
//
//  Created by hua on 9/13/16.
//  Copyright © 2016 SoftwareMerchant. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Parse


class InvitationObservation: NSObject {
    
    
    var temp = [String]()
    
    static let sharedInstance = InvitationObservation()
    
    func getInvitationNumber() -> Int {
        
        var temp = [String]()

        
        let rootRef = FIRDatabase.database().reference()
        
        
        let invitationRef = rootRef.child("invitation")
        
        
        let query = invitationRef.queryOrderedByChild("receivername")
        
        query.observeEventType(.ChildAdded, withBlock: {
            
            snapShot in
            
            let receivername =  snapShot.value!.objectForKey("receivername") as! String
            
            let flag = snapShot.value!.objectForKey("accepted") as! Bool
            
            
            if receivername == PFUser.currentUser()!.username! &&  flag == false {
                
                //                let alertView =  UIAlertView.init(title: "", message: "Do you want to add \(self.emailTextField.text!)", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Add")
                //
                //                alertView.show()
                
                temp.append((snapShot.value!.objectForKey("sendername") as! String))
                
                
                
            }
            
        })

        return temp.count
        
    }
    

}
