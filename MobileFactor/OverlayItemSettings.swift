//
//  OverlayItemSettings.swift
//  MobileFactor
//
//  Created by Vito D'Acunto on 05/03/17.
//  Copyright © 2017 Team OneDotOne. All rights reserved.
//

import UIKit

class OverlayItemSettings {
    
    
    // Our custom view from the XIB file
    var view: UIView!
    
    
    /**
     Initialiser method
     */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    
    /**
     Sets up the view by loading it from the xib file and setting its frame
     */
    override func setupView() {
        view = loadViewFromXibFile()
        view.frame = bounds
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = NSLocalizedString("Saved_to_garage", comment: "")
        
        /// Adds a shadow to our view
        view.layer.cornerRadius = 4.0
        view.layer.shadowColor = UIColor.blackColor().CGColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 4.0
        view.layer.shadowOffset = CGSizeMake(0.0, 8.0)
        
        visualEffectView.layer.cornerRadius = 4.0
    }
    
    /*
    Loads a view instance from the xib file
    
    - returns: loaded view
    */
    func loadViewFromXibFile() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "OverlayItemSettings", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
}
