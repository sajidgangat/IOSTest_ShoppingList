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
import Firebase
import FirebaseDatabase

class ViewController: UITableViewController {

    var todoarray = [shop]()
    var databaseRef : FIRDatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fill the data in th database
        databaseRef = FIRDatabase.database().reference().child("ShopingList")
        
        databaseRef.observe(.value, with: {(snapshot) in
            
            var newitems = [shop]()
            
            for item in snapshot.children{
                let newTodo = shop(snapshot : item as! FIRDataSnapshot)
                newitems.insert(newTodo, at: 0)
                
            }
            self.todoarray=newitems
            self.tableView.reloadData()
        })
            
        {(error) in
            
            print(error.localizedDescription)
            
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoarray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! shopTableViewCell
        
        
        cell.titlelabel.text = todoarray[indexPath.row].title
        cell.descriptionlabel.text = todoarray[indexPath.row].message
        //cell.datelabel.text=todoarray[indexPath.row].date
        cell.colorView.backgroundColor = UIColor(red: todoarray[indexPath.row].red, green: todoarray[indexPath.row].green, blue: todoarray[indexPath.row].blue, alpha: 1.0)
        
        return cell
        
    }
    
    //override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    performSegue(withIdentifier: "update", sender: self)
   // }
    
    //to delete the data from the table
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let ref = todoarray[indexPath.row].ref
            ref?.removeValue()
            todoarray.remove(at: indexPath.row)
            
            //tableView.deleteRows(at: <#T##[IndexPath]#>, with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "update" {
            let vc = segue.destination as! UpdateTableViewController
            let indexpath = tableView.indexPathForSelectedRow!
            vc.todo = todoarray[indexpath.row]
            
        }
    }
    
}



