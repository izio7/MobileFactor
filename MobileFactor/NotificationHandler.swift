//
//  NotificationHandler.swift
//  MobileFactor
//
//  Created by Sergio Shevchenko on 07/03/2017.
//  Copyright © 2017 Team OneDotOne. All rights reserved.
//

import UIKit

class NotificationHandler: NSObject {
    static var lastViewController: UIViewController? = nil
    static var domain: String?
    static var challenge: String?
    static var token: String?
    
    static func handleView(currentView view:UIViewController){
        lastViewController = view
        checkPending()
    }
    
    static func handleNotification(_domain: String, _challenge: String, _token: String){
        domain = _domain
        challenge = _challenge
        token = _token
        showNotification(domain: _domain)
    }
    
    static func checkPending(){
        let userDefaults = UserDefaults.standard
        domain = userDefaults.string(forKey: "domain")
        challenge = userDefaults.string(forKey: "challenge")
        token = userDefaults.string(forKey: "token")
        if domain != nil {
            showNotification(domain: domain!)
        }
    }
    
    static func showNotification(domain: String){
        let alert = UIAlertController(title: "Login request", message: "Attempting to login on \(domain).", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Deny access", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in RestAPI.revokeCredentials(challenge: challenge!, token: token!)}))
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in RestAPI.deliverCredentials(challenge: challenge!, token: token!, formData: CredentialStorageProvider.provideCredentials(forDomain: domain)!, completition:{ _, _, _ in })}))
        
        lastViewController?.present(alert, animated: true, completion: nil)
    }
}
