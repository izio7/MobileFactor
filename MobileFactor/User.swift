//
//  User.swift
//  MobileFactor
//
//  Created by Vito D'Acunto on 03/03/17.
//  Copyright © 2017 Team OneDotOne. All rights reserved.
//

import Foundation


class User {
    
    let emailID : String?
    let username : String?
    
    var confirmed : Bool = false
    
    
    init(email : String) {
        
        confirmed = false
        
        emailID = email
        
        username = nil
    }
    
    init (email:String, name: String) {
        confirmed = false
        
        emailID = email
    
        username = name
    }
    
    func login (username user: String ) -> Bool {
        
        if (user == emailID!) {
            return true
        }
        
        return false
    }
    
    
    
}
