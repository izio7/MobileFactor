//
//  TableViewCell.swift
//  myGroceryList
//
//  Created by Vito D'Acunto on 22/02/17.
//  Copyright © 2017 Vito D'Acunto. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // Cell Labels
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var serviceName: UILabel!
    
    // Funcs
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
