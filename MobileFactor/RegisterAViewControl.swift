//
//  PreLoginViewContro.swift
//  MobileFactor
//
//  Created by Vito D'Acunto on 01/03/17.
//  Copyright © 2017 Team OneDotOne. All rights reserved.
//

import UIKit

class RegisterAViewControl: UIViewController {
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        print(identifier)
        
        let name = userNameTextField.text
        let email = emailTextField.text
        
        if (name != ""  && self.validateEmail(enteredEmail: email!)) {
            print("ok")
            return true
        }
        
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.text = ""
        emailTextField.text = ""
        
        userNameTextField.placeholder = "username"
        emailTextField.placeholder = "email"
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    func viewWillAppear() {
        
    }
    
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    
    /*
     
     // How to send emails:
     func sendEmail(receiver receiver : String) {
     if MFMailComposeViewController.canSendMail() {
     let mail = MFMailComposeViewController()
     
     mail.mailComposeDelegate = self
     
     mail.setToRecipients(["paul@hackingwithswift.com"])
     
     mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
     
     present(mail, animated: true)
     } else {
     // show failure alert
     }
     }
     
     func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
     controller.dismiss(animated: true)
     }
     
     */
    
}

