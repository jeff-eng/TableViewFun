//
//  ViewController.swift
//  Times Tables
//
//  Created by Jeffrey Eng on 11/3/16.
//  Copyright © 2016 Jeffrey Eng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var sliderValue: UISlider!
    
    @IBAction func sliderMoved(sender: AnyObject) {
        //calling reloadData method runs the tableView methods whenever slider is moved/changed
        table.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        let timesTable = Int(sliderValue.value * 20)
        
        cell.textLabel?.text = "\(timesTable * (indexPath.row + 1))"
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

