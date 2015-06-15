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

    @IBAction func newButtonPressed(sender: AnyObject) {
        
        performSegueWithIdentifier("newAddress", sender: sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var singlePlace = [String: Double]()
        singlePlace["latitude"] = 51.6052258
        singlePlace["longitude"] = -0.0552078
        
        memorablePlaces["33B Willoughy Park Road"] = singlePlace;
        addressArray.append("33B Willoughy Park Road");
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return memorablePlaces.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell");
        
        var placeName = addressArray[indexPath.row]
        
        cell.textLabel?.text = placeName;
        
        return cell;
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        addressToPass = addressArray[indexPath.row];
        
        self.performSegueWithIdentifier("showMap", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "showMap") {
            
            // initialize new view controller and cast it as your view controller
            var viewController = segue.destinationViewController as! MapViewController
            
            // your new view controller should have property that will store passed value
            viewController.passedAddress = addressToPass
            
        }
        
        if (segue.identifier == "newAddress") {
            
            // initialize new view controller and cast it as your view controller
            var viewController = segue.destinationViewController as! MapViewController
            
            // your new view controller should have property that will store passed value
            viewController.passedAddress = nil
            
        }
        
        
    }
    
    
}

