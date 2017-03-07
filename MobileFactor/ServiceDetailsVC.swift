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
    
    @IBOutlet weak var domain: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var autologin: UISwitch!
    
    @IBOutlet weak var exitButton: UIButton!
}
