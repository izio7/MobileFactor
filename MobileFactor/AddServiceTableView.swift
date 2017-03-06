//
//  AddServiceTableView.swift
//  MobileFactor
//
//  Created by Vito D'Acunto on 06/03/17.
//  Copyright © 2017 Team OneDotOne. All rights reserved.
//

import UIKit

class AddServiceTableView : UITableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    /*
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return itemStore.itemCollection.count
    }
    */
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath) as! TableViewCell
        
        // Configure the cell...
        
        let item = itemStore.itemCollection[indexPath.row]
        
        cell.titleLabel.text = item.name
        cell.descLabel.text = item.desc
        cell.quantLabel.text = "\(item.quantityValue)"
        
        return cell
    }
    */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            itemStore.itemCollection.remove(at: indexPath.row)
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.reloadData()
            
        }
        /*
         else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
         */
    }
    */
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        itemStore.move(from: fromIndexPath.row, to: to.row)
        
        tableView.reloadData()
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    /*
    @IBAction func addItem(_ sender: Any) {
        
        itemStore.addItem(name: "", desc: "", quant: 0)
        tableView.reloadData()
    }
    */
    
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier {
        case "showItem"? :
            /*
            if let currentIndex = tableView.indexPathForSelectedRow?.row {
                
                let item = itemStore.itemCollection[currentIndex]
                
                let dstView = segue.destination as! DetailsViewController
                
                dstView.currentItem = item
            
                */
                break
        
            
        case "createElement"? :
            /*
            var it : Item
            
            it = itemStore.addItem(name: "", desc: "", quant: 0)
            
            
            let dstView = segue.destination as! DetailsViewController
            
            dstView.currentItem = it
            */
        
            break
            
        default:
            
            
            
            break
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
}
