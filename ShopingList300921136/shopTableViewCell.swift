//
//  
//
//
//  Created by Sajid gangat on 2017-02-14.
//  Copyright © 2017 Sajid. All rights reserved.
// SAJID GANGAT
// Student ID :300921136
//
//

import UIKit
import  Firebase
import FirebaseDatabase

class shopTableViewCell: UITableViewCell {
    var todo : shop!
    var databaseref : FIRDatabaseReference!
    {
        return FIRDatabase.database().reference()
    }
    
   // @IBOutlet weak var switchlbl: UISwitch!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var titlelabel: UILabel!

    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var descriptionlabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func switch_change(_ sender: UISwitch) {
        if(sender.isOn){
            titlelabel.textColor = UIColor.black
           // let updatetodo = "complted"
            
            //let key = todo.ref!.key
           
            //let updateref = databaseref.child("/ToDoList/\(key)/")
           // updateref.updateChildValues(updatetodo)
        
        }
        else{
            titlelabel.textColor = UIColor.gray
        }
    }
}
