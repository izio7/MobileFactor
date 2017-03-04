//
//  ServerFake.swift
//  MobileFactor
//
//  Created by Vito D'Acunto on 04/03/17.
//  Copyright © 2017 Team OneDotOne. All rights reserved.
//

import Foundation

class ServerFake {
    
    init () {
        
    }
    
    func fakeServerResponse () -> Array<Int> {
        
        var confirmationCode : [Int] = []
        
        confirmationCode.append(Int(arc4random_uniform(9) + 1))
        confirmationCode.append(Int(arc4random_uniform(9) + 1))
        confirmationCode.append(Int(arc4random_uniform(9) + 1))
        
        confirmationCode.append(Int(arc4random_uniform(9) + 1))
        confirmationCode.append(Int(arc4random_uniform(9) + 1))
        confirmationCode.append(Int(arc4random_uniform(9) + 1))
        
        return confirmationCode
    }
    
    func fakeServerResponseSimplified () -> String {
        
        var confirmationCode = "aaa123"
        
        return confirmationCode
    }
    
    /*
    func verifyUser (user : User, insertCode : [Int]) -> Bool {
        
        //wait for the response from the backend confirmation
        
        let response = fakeServerResponseSimplified()
        
        let verify = user.checkStringCode(cod1: response, cod2: insertCode)
        
        if (verify == true) {
            user.confirmed = true
            return true
        }
        
        user.confirmed = false
        return false
    }
    */
}
