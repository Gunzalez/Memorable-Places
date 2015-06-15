//
//  ViewController.swift
//  Memorable Places
//
//  Created by Segun Konibire on 15/06/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    var memorablePlaces = [String: Dictionary<String, String>]()
    var singlePlace = [String: String]()
    var addressArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        singlePlace["longitude"] = "-51.0206701"
        singlePlace["latitude"] = "0.010880"
        singlePlace["postalcode"] = "N17 0RR"
        
        memorablePlaces["Place One"] = singlePlace;
        addressArray.append("Place One");
        
        
        
        
        
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
        
        self.performSegueWithIdentifier("showMap", sender: indexPath)
        
    }
    
    
//    
//    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//    {
//    [self performSegueWithIdentifier:@"masterToDetails" sender:indexPath];
//    }


    
    
    
    
    
    
    
    
    
    
}

