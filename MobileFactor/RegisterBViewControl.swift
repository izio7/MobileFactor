//
//  RegisterBViewControl.swift
//  MobileFactor
//
//  Created by Vito D'Acunto on 04/03/17.
//  Copyright © 2017 Team OneDotOne. All rights reserved.
//

import UIKit

class RegisterBViewControl : UIViewController {
    
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var confirmCodeButton: UIButton!
    
    override func viewDidLoad () {
        
        codeTextField.text = ""
        codeTextField.placeholder = "- - - / - - -"
    }
    
    func viewWillAppear() {
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let server = ServerFake ()
        
        let response = server.fakeServerResponseSimplified()
        
        return evaluateCode(string: response)
    }
    
    func evaluateCode (string : String) -> Bool {
        
        let code = codeTextField.text
        
        
        if (!self.codeHasRightNumberOfCharacters(code: code!)) {
            return false
        }
        
        if (!(string == code)) {
            return false
        }
        
        
        return true
        
        
    }
    
    func codeHasRightNumberOfCharacters(code : String) -> Bool{
        
        if (code.characters.count != 6) { return false }
        
        return true
        
    }
}
