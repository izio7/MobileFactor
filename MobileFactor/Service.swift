//
//  Service.swift
//  MobileFactor
//
//  Created by Vito D'Acunto on 06/03/17.
//  Copyright © 2017 Team OneDotOne. All rights reserved.
//

import UIKit
import Foundation

class Service : NSObject {
    
    var showedName : String = ""
    var domain : String = ""
    var icon : UIImage?
    
    var username = ""
    var password = ""
    
    var login : Bool
    
    init (showedName: String, domain: String, icon: UIImage) {
        self.showedName = showedName
        self.domain = domain
        self.icon = icon
        
        self.username = ""
        self.password = ""
        
        login = true
    }
    
    init (showedName: String, domain: String, icon: UIImage?, user : String, pass: String) {
        self.showedName = showedName
        self.domain = domain
        self.icon = icon
        
        self.username = user
        self.password = pass
        
        login = true
    }
    
    
    
}
