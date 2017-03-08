//
//  LoginViewController.swift
//  MobileFactor
//
//  Created by Vito D'Acunto on 03/03/17.
//  Copyright © 2017 Team OneDotOne. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController : UIViewController {
    
    var user : User?
    
    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var accessButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction func accessButtonPressed(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.text=""
        emailTextField.placeholder = "inserisci la tua mail"
        
        user = createFakeUser()
        
        emailTextField.keyboardType = UIKeyboardType.default
        
        test()
        
    }
    
    func viewWillAppear() {
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if (identifier == "access")  {
        
            let userInserted = emailTextField.text
        
            if (user?.login(username: userInserted!))! {
                return true
            }
        }
        
        else if (identifier == "register") {
            return true
        }
        
        else {
            accessButton.setTitle("Dati Errati", for: .normal)
        }
        
        return false
    }
    
    
    func createFakeUser () -> User {
        let u = User (email: "email")
        
        
        return u
    }
    
    func test() {
        let context = LAContext()
        
        var error: NSError?
        
        if context.canEvaluatePolicy( LAPolicy.deviceOwnerAuthentication,error: &error) {
            
            // Device can use TouchID
            
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthentication,localizedReason: "Access requires authentication", reply: {
                (success, error) in DispatchQueue.main.async {
                    
                    if error != nil {
                        
                        switch error!._code {
                            
                        case LAError.Code.systemCancel.rawValue:
                            self.notifyUser("Session cancelled", err: error?.localizedDescription)
                            
                        case LAError.Code.userCancel.rawValue:
                            self.notifyUser("Please try again", err: error?.localizedDescription)
                            
                        case LAError.Code.userFallback.rawValue:
                            self.notifyUser("Authentication", err: "Password option selected")
                            // Custom code to obtain password here
                            
                        default:
                            self.notifyUser("Authentication failed", err: error?.localizedDescription)
                        }
                        
                    } else {
                        
                        self.performSegue(withIdentifier: "access", sender: self)
                        //self.notifyUser("Authentication Successful", err: "You now have full access")
                        
                    }
                }
            })
            
        } else {
            // Device cannot use TouchID
            switch error!.code{
                
            case LAError.Code.touchIDNotEnrolled.rawValue:
                notifyUser("TouchID is not enrolled",err: error?.localizedDescription)
                
            case LAError.Code.passcodeNotSet.rawValue:
                notifyUser("A passcode has not been set", err: error?.localizedDescription)
                
            default:
                notifyUser("TouchID not available", err: error?.localizedDescription)
                
            }
        }
    }
    
    private func notifyUser(_ msg: String, err: String?) {
        let alert = UIAlertController(title: msg,message: err, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true,completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
}
