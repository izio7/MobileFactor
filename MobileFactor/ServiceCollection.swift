//
//  ServiceCollection.swift
//  MobileFactor
//
//  Created by Vito D'Acunto on 06/03/17.
//  Copyright © 2017 Team OneDotOne. All rights reserved.
//

import Foundation
import UIKit

class ServiceCollection {
    
    var collection = [Service]()
    
    init () {
        
        self.addItem(x: "facebook", y: "facebook.com", z: #imageLiteral(resourceName: "fbIcon"))
        self.addItem(x: "twitter", y: "twitter.com", z: #imageLiteral(resourceName: "twitterIcon"))
    }
    
    init (x: String) {
        self.addItem(x: "facebook", y: "facebook.com", z: #imageLiteral(resourceName: "fbIcon"), j: "vito", k: "password")
    }
    
    func addItem (x : String, y : String, z : UIImage) -> Service {
        
        let i = Service(showedName: x, domain: y, icon: z)
        
        collection.append(i)
        
        return i
    }
    
    func addItem (x : String, y : String, z : UIImage, j: String, k: String) -> Service {
        
        let i = Service(showedName: x, domain: y, icon: z, user: j, pass: k)
        
        collection.append(i)
        
        return i
    }
    
    
    func move (from : Int, to : Int) {
        
        collection.insert(collection.remove(at: from), at: to)
        
    }
}
