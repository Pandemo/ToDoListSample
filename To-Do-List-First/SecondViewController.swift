//
//  SecondViewController.swift
//  To-Do-List-First
//
//  Created by Sahejvir Locham on 9/14/15.
//  Copyright (c) 2015 Sahejvir Locham. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textItem: UITextField!
    @IBAction func addItem(sender: AnyObject) {
        
        toDoListArr.append(textItem.text!)
        textItem.text = ""
        NSUserDefaults.standardUserDefaults().setObject(toDoListArr, forKey: "toDoListArr")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //keyboard functions to retract when touched outside/return pressed
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn (textField: UITextField!) -> Bool{
        
        textItem.resignFirstResponder()
        return true
    }

}

