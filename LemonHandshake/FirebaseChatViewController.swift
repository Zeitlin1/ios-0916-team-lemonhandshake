//
//  FirebaseChatViewController.swift
//  LemonHandshake
//
//  Created by Tameika Lawrence on 11/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import Firebase

class FirebaseChatViewController: UIViewController {
    
    var ref: FIRDatabaseReference! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        }

    
    func creatChat() {
    
        ref = FIRDatabase.database().reference().child("chats")
        
        let chatRef = ref.childByAutoId()
    
        
        chatRef.setValue([String:Any](), forKey: "initiatives")
        
        
        
    
    }
    

}


//chatmessages -> initiativeID -> messageID -> (content, timestamp, userID) 


