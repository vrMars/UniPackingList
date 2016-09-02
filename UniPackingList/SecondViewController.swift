//
//  SecondViewController.swift
//  UniPackingList
//
//  Created by Neelaksh Bhatia on 2016-09-01.
//  Copyright © 2016 Neelaksh Bhatia. All rights reserved.
//

import UIKit

var Todolist = [String]()
class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textfield: UITextField!
    @IBAction func additem (sender: AnyObject) {
        todolist.append(textfield.text!)
        textfield.text = ""
        

        
        
        UserDefaults.standard.set(todolist, forKey: "list")
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textfield.delegate=self

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event : UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

