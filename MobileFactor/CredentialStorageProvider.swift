//
//  CredentialStorageProvider.swift
//  MobileFactor
//
//  Created by Sergio Shevchenko on 07/03/2017.
//  Copyright © 2017 Team OneDotOne. All rights reserved.
//

import UIKit

class CredentialStorageProvider: NSObject {
    static func provideCredentials(forDomain: String) -> [(String, String)]? {
        //TODO get data from someWhere
        print("Providing data for \(forDomain)");
        
        return [("login", "Pippo"), ("pass", "Lippo")];
    }
}
