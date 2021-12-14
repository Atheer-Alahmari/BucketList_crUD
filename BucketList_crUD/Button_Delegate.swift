//
//  Button_Delegate.swift
//  BucketList_crUD
//
//  Created by Atheer Alahmari on 10/05/1443 AH.
//

import UIKit
protocol Button_Delegate :class{
    func cansel_Pressed( pressed : AddItem)
    func save_Pressed( pressed : AddItem,  text : String ,  index : NSIndexPath?)

}
