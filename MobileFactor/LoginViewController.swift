//
//  LoginViewController.swift
//  MobileFactor
//
//  Created by Vito D'Acunto on 03/03/17.
//  Copyright © 2017 Team OneDotOne. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController {
    
    var user : User?
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var accessButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction func accessButtonPressed(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.text=""
        emailTextField.placeholder="inserisci la tua mail"
        
        user = createFakeUser()
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
}
