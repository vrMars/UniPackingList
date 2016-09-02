//
//  FirstViewController.swift
//  UniPackingList
//
//  Created by Neelaksh Bhatia on 2016-09-01.
//  Copyright © 2016 Neelaksh Bhatia. All rights reserved.
//

import UIKit

var todolist = [String]()


class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "list") != nil {
            todolist = UserDefaults.standard.object(forKey:"list") as! [String]
        }
        self.tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todolist.count
    }*/
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = todolist [indexPath.row]
        return cell
    }
    func tableView(_: UITableView, numberOfRowsInSection: Int) -> Int{
        return todolist.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            todolist.remove(at:indexPath.row)
            UserDefaults.standard.set(todolist, forKey: "list")
            tableView.reloadData()
            
        }
    
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }




}

