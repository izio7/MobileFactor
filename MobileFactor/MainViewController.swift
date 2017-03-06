//
//  MainViewController.swift
//  MobileFactor
//
//  Created by Vito D'Acunto on 03/03/17.
//  Copyright © 2017 Team OneDotOne. All rights reserved.
//

import UIKit

class MainViewController : UIViewController {
    
    //Item passed - cu stands for current item
    var cu : User!
    
    @IBAction func exampleButton(_ sender: Any) {
        prepareAlertController()
    }
    @IBOutlet weak var userLabel: UILabel!
    
    // funnyImage still needs a source path and some constraints on max/min width & heigth
    // funnyImage is a funny 404like image that is showed only if the user has no added service
    // ToBeImplemented: something like "oooops, I don't find any service!"
    // Vito 2017 05 03
    @IBOutlet weak var funnyImage: UIImageView!
    
    @IBOutlet weak var accessSwitch: UISwitch!
    
    @IBOutlet weak var funnyImageStack: UIStackView!
    
    @IBOutlet weak var ServicesStack: UIStackView!
    
    let alertController = UIAlertController(title: nil, message: "Demo", preferredStyle: .actionSheet)

    func prepareAlertController () {
        
        
        let editAction = UIAlertAction(title: "Edit", style: .default) {
            _ in
        }
        
        let accessAction = UIAlertAction(title: "Accedi Automaticamente", style: .default) {
            _ in
            
            switch (self.accessSwitch.isOn) {
            case true :
                self.accessSwitch.isOn = false
            break
                
                
            case false :
                self.accessSwitch.isOn = true
                break
                
            }
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        
        
        alertController.addAction(editAction)
        alertController.addAction(accessAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showFunnyImageStack(boolean: false)
        
        accessSwitch.isEnabled = false
        
        //userLabel.text = cu.username
        
        
        if (userHasNoServices()) {
            
            self.showFunnyImageStack(boolean: true)
            
        }
        
    }
    
    func showFunnyImageStack (boolean : Bool) {
        
        switch (boolean) {
            case true:
                funnyImageStack.isHidden = false
                ServicesStack.isHidden = true
            break
            
            case false:
                funnyImageStack.isHidden = true
                ServicesStack.isHidden = false
            break
            
        default:
            funnyImageStack.isHidden = true
            break
        }
        
    }
    
    func userHasNoServices() -> Bool {
        return true
    }
    
}
