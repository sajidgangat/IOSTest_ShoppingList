//
//  Todo.swift
//  ToDoList_300921136
//
//  Created by Sajid gangat on 2017-02-15.
//  Copyright © 2017 Sajid. All rights reserved.
// SAJID GANGAT
// Student ID :300921136
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

struct shop {
    var title :String!
    var message: String!
    var date: String!
    var red : CGFloat!
    var blue : CGFloat!
    var green : CGFloat!
    var ref : FIRDatabaseReference!
    var key : String!
    
    init(title : String, message : String, date : String, red : CGFloat, blue : CGFloat , green : CGFloat, key : String = "") {
        self.title = title
        self.message = message
        self.date = date
        self.red = red
        self.blue = blue
        self.green = green
        self.key = key
        self.ref = FIRDatabase.database().reference()
    }
    
    init(snapshot : FIRDataSnapshot) {
        
        let value = snapshot.value as? NSDictionary
        
        self.title = value?["title"] as! String
        self.message = value?["message"] as! String
        self.date = value?["date"] as! String
        self.red = value?["red"] as! CGFloat
        self.blue = value?["blue"] as! CGFloat
        self.green = value?["green"] as! CGFloat
        self.key = snapshot.key
        self.ref = snapshot.ref

    }
    
    func toAnyObject() -> [String : AnyObject]
    {
        return["title" : title as AnyObject , "message" : message as AnyObject, "date" : date as AnyObject, "red" : red as AnyObject, "blue" : blue as AnyObject,  "green" : green as AnyObject]
    }
}
