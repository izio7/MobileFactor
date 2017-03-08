//
//  ServiceDetailsVC.swift
//  MobileFactor
//
//  Created by Vito D'Acunto on 06/03/17.
//  Copyright © 2017 Team OneDotOne. All rights reserved.
//

import Foundation
import UIKit

class ServiceDetailsVC : UIViewController{
    
    // Item to pass
    
    var currentService : Service!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        domain.text = currentService.domain
        username.text = currentService.username
        password.text = currentService.password
        autologin.isOn = currentService.login
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    //Save new service
    func saveService(email : String, pass : String, domain : String){
        //Crittografia di email e password//
        //.....
        //Al posto di email e pass ci andranno quelle crittografate
        let service = ["email": email, "Pass": pass]
        UserDefaults.standard.setValue(service, forKey: "mf_" + domain)
        print("Service after save: " + "\(UserDefaults.standard.object(forKey: "mf_" + domain))")
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if (identifier == "saveService") {
            print("Username from textView: " + username.text!)
            self.saveService(email: username.text!, pass: password.text!, domain: domain.text!)
            print("Saved!!")
            return true
        }
        return false;
    }
    
    @IBOutlet weak var domain: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var autologin: UISwitch!
    
    @IBOutlet weak var exitButton: UIButton!
}
