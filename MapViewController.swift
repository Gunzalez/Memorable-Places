//
//  MapViewController.swift
//  Memorable Places
//
//  Created by Segun Konibire on 15/06/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    var passedAddress:String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.mapView.delegate = self
        
        var latitude: CLLocationDegrees!
        
        var longitude: CLLocationDegrees!
        
        if passedAddress != nil {
        
            self.title = passedAddress;
        
            var singleAddress: Dictionary = memorablePlaces[passedAddress]! as Dictionary
        
            latitude = singleAddress["latitude"]!
        
            longitude = singleAddress["longitude"]!
            
        } else {
            
            self.title = "New place"
            
            latitude = 51.515656
            
            longitude = -0.09387
            
        }
        
        var latDelta: CLLocationDegrees = 0.01
        
        var lonDelta: CLLocationDegrees = 0.01
        
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, latDelta)
        
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.mapView.setRegion(region, animated: true)
        
        if passedAddress != nil {
            
            var location = CLLocationCoordinate2DMake(latitude, longitude)
            
            var dropPin = MKPointAnnotation()
            
            dropPin.coordinate = location
            
            dropPin.title = passedAddress
            
            mapView.addAnnotation(dropPin)
            
        }
        
        var longPress = UILongPressGestureRecognizer(target: self, action: "action:")
        
        longPress.minimumPressDuration = 2.0
        
        mapView.addGestureRecognizer(longPress)
    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        
        if ( gestureRecognizer.state == UIGestureRecognizerState.Began ){
            
            var touchPoint = gestureRecognizer.locationInView(self.mapView)
            
            var newCoord:CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
            
            var singlePlace = [String: Double]()
            singlePlace["latitude"] = newCoord.latitude
            singlePlace["longitude"] = newCoord.longitude
            
            memorablePlaces["New Location"] = singlePlace
            addressArray.append("New Location")
            
            var newAnotation = MKPointAnnotation()
            
            newAnotation.coordinate = newCoord
            
            newAnotation.title = "New Location"
            
            newAnotation.subtitle = "This has been added!"
            
            self.mapView.addAnnotation(newAnotation)
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
