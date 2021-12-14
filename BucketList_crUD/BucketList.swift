//
//  ViewController.swift
//  BucketList_crUD
//
//  Created by Atheer Alahmari on 10/05/1443 AH.
//

import UIKit

class BucketList: UITableViewController , Button_Delegate{
   
    
    @IBOutlet var tabel_view: UITableView!
    var items :[String]=["Atheer","Alahmari"]
  //--------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabel_view.dataSource = self
    }
    //--------------------------------------------------------------------------

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabel_view.dequeueReusableCell(withIdentifier: "ID_Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "EditItem_Segue", sender: indexPath)
//    } if i click the cell
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItem_Segue", sender: indexPath)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tabel_view.reloadData()
    }
    //--------------------------------------------------------------------------


    func cansel_Pressed(pressed: AddItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func save_Pressed(pressed: AddItem, text: String, index: NSIndexPath?) {
        if text != ""{
       if  let ip = index {
           items[ip.row] = text
        } else{
            items.append(text)

        }
        tabel_view.reloadData()
        }
        dismiss(animated: true, completion: nil)
    }
    
    //--------------------------------------------------------------------------

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddItem_Segue"{
            
        let navegtion  = segue.destination as! UINavigationController
        let add_Item = navegtion.topViewController as! AddItem
            add_Item.delegate = self
        }
        else if segue.identifier == "EditItem_Segue" {
            
            let navegtion  = segue.destination as! UINavigationController
            let add_Item = navegtion.topViewController as! AddItem
                add_Item.delegate = self
            
            let index = sender as! NSIndexPath
            let editItem = items[index.row]
            add_Item.item = editItem
            add_Item.index_path = index
        }
        
    }
    

}

