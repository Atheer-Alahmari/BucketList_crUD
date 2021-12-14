//
//  AddItem.swift
//  BucketList_crUD
//
//  Created by Atheer Alahmari on 10/05/1443 AH.
//

import UIKit

class AddItem: UITableViewController {
 
    @IBOutlet weak var text_TF: UITextField!
    
    weak var delegate : Button_Delegate?
    var item : String?
    var index_path: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        text_TF.text = item
    }


    @IBAction func cancel_Action(_ sender: UIBarButtonItem) {
        delegate?.cansel_Pressed(pressed: self)
    }
    
    @IBAction func save_Action(_ sender: Any) {
        let newitem = text_TF.text!
        delegate?.save_Pressed(pressed: self, text : newitem, index : index_path)
    }
  

}
