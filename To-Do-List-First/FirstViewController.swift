//
//  FirstViewController.swift
//  To-Do-List-First
//
//  Created by Sahejvir Locham on 9/14/15.
//  Copyright (c) 2015 Sahejvir Locham. All rights reserved.
//

import UIKit

//create global array of strngs
var toDoListArr = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //check if this exists for the first time app runs
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoListArr") != nil {
            
               toDoListArr = NSUserDefaults.standardUserDefaults().objectForKey("toDoListArr") as! [String]
            
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return toDoListArr.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoListArr[indexPath.row]
        return cell
    }
    //swipe to delete feature
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
    
        if editingStyle == UITableViewCellEditingStyle.Delete{
            
            toDoListArr.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject("toDoListArrat", forKey: "toDoListArray")
            table.reloadData()
        }
        
        
    }
    
    //runs everytime the view appears, not only when its loaded.
    override func viewDidAppear(animated: Bool) {
        table.reloadData()
    }
}

