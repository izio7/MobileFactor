//
//  AddServiceViewController.swift
//  MobileFactor
//
//  Created by Vito D'Acunto on 06/03/17.
//  Copyright © 2017 Team OneDotOne. All rights reserved.
//

import UIKit

class AddServiceViewController : UIViewController {
    
    var services = [UIButton : (String, String)]()
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var fb: UIButton!
    @IBOutlet weak var twitter: UIButton!
    @IBOutlet weak var gmail: UIButton!
    @IBOutlet weak var gplus: UIButton!
    @IBOutlet weak var mega: UIButton!
    @IBOutlet weak var onedrive: UIButton!
    @IBOutlet weak var tumblr: UIButton!
    @IBOutlet weak var flickr: UIButton!
    
    var domain : String = ""
    
    @IBOutlet weak var domainField: UITextField!
    
    override func viewDidLoad() {
        
        setServicesDictionary()
        
        for button in services {
            button.key.addTarget(self, action:#selector(AddServiceViewController.oneButtonPressed(sender:)), for: .touchUpInside)
        }
        
        domainField.text = ""
    }
    
    func oneButtonPressed (sender: UIButton!) {
        
        for button in services {
            
            if (button.key.imageView?.image == sender.imageView?.image) {
                
                domain = button.value.0
                
                button.key.setImage(selectImage(imageName: button.value.1), for: .normal)
                
                domainField.text = domain
            }
            
            else {
                
                button.key.setImage(selectTransparentImage(imageName: button.value.1), for: .normal)
                
            }
        }
    }
    
    
    func selectImage (imageName : String) -> UIImage {
        switch imageName {
            case "fbIcon":
                return #imageLiteral(resourceName: "fbIcon")
            
            case "twitterIcon":
                return #imageLiteral(resourceName: "twitterIcon")
            
            case "tumblrIcon":
                return #imageLiteral(resourceName: "tumblrIcon")
            
            case "megaIcon":
                return #imageLiteral(resourceName: "megaIcon")
            
            case "gmailIcon":
                return #imageLiteral(resourceName: "gmailIcon")
            
            case "googlePlusIcon":
                return #imageLiteral(resourceName: "googlePlusIcon")
            
            case "flickrIcon":
                return #imageLiteral(resourceName: "flickrIcon")
            
            case "oneDriveIcon":
                return #imageLiteral(resourceName: "oneDriveIcon")
            
        // con un po' di fortuna al default non ci si arriva mai
            default:
                return #imageLiteral(resourceName: "megaIcon")
        }
    }
    
    func selectTransparentImage (imageName : String) -> UIImage {
        
        switch imageName {
            case "fbIcon":
                return #imageLiteral(resourceName: "fbIconTransparent")
            
            case "twitterIcon":
                return #imageLiteral(resourceName: "twitterIconTransparent")
            
            case "tumblrIcon":
                return #imageLiteral(resourceName: "tumblrIconTransparent")
            
            case "megaIcon":
                return #imageLiteral(resourceName: "MegaIconTransparent")
            
            case "gmailIcon":
                return #imageLiteral(resourceName: "gmailIconTransparent")
            
            case "googlePlusIcon":
                return #imageLiteral(resourceName: "googlePlusIconTransparent")
            
            case "flickrIcon":
                return #imageLiteral(resourceName: "flickrIconTransparent")
            
            case "oneDriveIcon":
                return #imageLiteral(resourceName: "OneDriveIconTransparent")
            
            // con un po' di fortuna al default non ci si arriva mai
            default:
                return #imageLiteral(resourceName: "MegaIconTransparent")
        }
    }
        
    
    
    
    func setServicesDictionary () {
        
        services[fb] = ("facebook.com", "fbIcon")
        services[twitter] = ("twitter.com", "twitterIcon")
        services[tumblr] = ("tumblr.com", "tumblrIcon")
        services[mega] = ("mega.com", "megaIcon")
        services[gmail] = ("mail.google.com", "gmailIcon")
        services[gplus] = ("plus.google.com", "googlePlusIcon")
        services[flickr] = ("flickr.com", "flickrIcon")
        services[onedrive] = ("onedrive.com", "oneDriveIcon")
        
    }
    
}

