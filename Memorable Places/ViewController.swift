//
//  ViewController.swift
//  Memorable Places
//
//  Created by Segun Konibire on 15/06/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit

var memorablePlaces = [String: Dictionary<String, Double>]()
var addressArray = [String]()

class ViewController: UIViewController, UITableViewDelegate {
    
    var addressToPass = String()
    
    @IBOutlet var tableView: UITableView!
    

    @IBAction func newButtonPressed(sender: AnyObject) {
        
        performSegueWithIdentifier("newAddress", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var singlePlace = [String: Double]()
//        singlePlace["latitude"] = 51.6052258
//        singlePlace["longitude"] = -0.0552078
//        
//        memorablePlaces["33B Willoughy Park Road"] = singlePlace;
//        addressArray.append("33B Willoughy Park Road");

        
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return addressArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell");
        
        var nameOfPlace = addressArray[indexPath.row]
        
        cell.textLabel?.text = nameOfPlace;
        
        return cell;
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        addressToPass = addressArray[indexPath.row];
        
        self.performSegueWithIdentifier("showMap", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            
        var viewController = segue.destinationViewController as! MapViewController
        
        if (segue.identifier == "showMap") {
            viewController.passedAddress = addressToPass
        }
        
        if (segue.identifier == "newAddress") {
            viewController.passedAddress = nil
            
        }
        
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            
            var placeToRemove = addressArray[indexPath.row]
            
            memorablePlaces[placeToRemove] = nil
            
            addressArray.removeAtIndex(indexPath.row)
            
            tableView.reloadData()
        }
    }
    
    
}

