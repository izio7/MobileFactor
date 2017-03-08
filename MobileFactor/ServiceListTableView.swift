//
//  AddServiceTableView.swift
//  MobileFactor
//
//  Created by Vito D'Acunto on 06/03/17.
//  Copyright © 2017 Team OneDotOne. All rights reserved.
//

import UIKit

class ServiceListTableView : UITableViewController {
    
    var myServices = ServiceCollection(x: "my")
    let userReloaded = UserDefaults.standard
    var objectArray : [Service]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //objectArray = readAllMyServices()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        
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
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("Count objectArray: " + "\(objectArray!.count)")
        return objectArray!.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath) as! TableViewCell
        
        // Configure the cell...
        
        let serv = objectArray?[indexPath.row]
        
        //var serv = myServices.collection[indexPath.row]

        cell.icon.image = serv?.icon
        //print("Icon: " + "\(serv?.icon)")
        //print()
        cell.serviceName.text = serv?.showedName
        //print("ShowedName: " + "\(serv?.showedName)")
        //print()
        //print("Username: " + "\(serv?.username)")
        //print()
        //print("Password: " + "\(serv?.password)")
        //print()
        //print("Service: " + "\(serv)")
        //print()
        
        return cell
    }
    
    
    func readAllMyServices() -> [Service]{
        var objectArray = [Service]()
        var key_domain = ""
        var mail_value = ""
        var pass_value = ""
        var icon_value : UIImage? = nil
        var dict_return = ["":""]

        //For remove all elements with mf_ prefix in the UserDefaults
        /*for key in userReloaded.dictionaryRepresentation().keys{
            if(key.hasPrefix("mf_")){
                print("First: " + "\(userReloaded.dictionaryRepresentation())")
                userReloaded.removeObject(forKey: key)
                print("After: " + "\(userReloaded.dictionaryRepresentation())")
            }
        }*/
        
        var i = 0
        for key in userReloaded.dictionaryRepresentation().keys{
            i = i + 1
            print("i: " + "\(i)")
            if(key.hasPrefix("mf_")){
                dict_return = userReloaded.object(forKey: key) as! Dictionary<String, String>
                key_domain = key
                
                //SWITCH PER SCELTA DELL'ICONA
                switch key_domain {
                    case "mf_facebook.com":
                        icon_value = #imageLiteral(resourceName: "fbIcon")
                    case "mf_twitter.com":
                        icon_value = #imageLiteral(resourceName: "twitterIcon")
                default:
                    icon_value = #imageLiteral(resourceName: "fbIcon")
                }
                
                //Substring per eliminare il prefisso mf_
                let startIndex = key_domain.index(key_domain.startIndex, offsetBy: 3)
                key_domain = key_domain.substring(from: startIndex)
                mail_value = dict_return["email"]!
                pass_value = dict_return["Pass"]!
                let serv = Service(showedName: key_domain, domain: key_domain, icon: icon_value, user: mail_value, pass: pass_value)
                objectArray.append(serv)
            }
        }
        return objectArray
    }
    
        /*func readServiceInfo(domain : String){
            let userReloaded = UserDefaults.standard.object(forKey: "mf_" + domain) as! Dictionary<String, String>
            let mail_crypted = userReloaded["email"]
            let pass_crypted = userReloaded["Pass"]
            //Decriptaggio di mail e pass//
            //.....
        }*/
    
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
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
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
            
             if let currentIndex = tableView.indexPathForSelectedRow?.row {
             
             let s = objectArray?[currentIndex]
                print("Segue objectArray email:" + "\(s?.username)")
             //let s = myServices.collection[currentIndex]
             
             let dstView = segue.destination as! ServiceDetailsVC
             dstView.currentService = s
             }
            break
         
            
        default:
            
            
            
            break
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        objectArray = readAllMyServices()
        print("Count objectArray: " + "\(objectArray!.count)")
        tableView.reloadData()
    }
    
}
