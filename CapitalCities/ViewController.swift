//
//  ViewController.swift
//  CapitalCities
//
//  Created by My Nguyen on 8/15/16.
//  Copyright © 2016 My Nguyen. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // these Capital objects conform to the MKAnnotation protocol, so they can be sent
        // to map view for display via addAnnotation()
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")

        /*
        mapView.addAnnotation(london)
        mapView.addAnnotation(oslo)
        mapView.addAnnotation(paris)
        mapView.addAnnotation(rome)
        mapView.addAnnotation(washington)
         */
        mapView.addAnnotations([london, oslo, paris, rome, washington])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        // a reuse identifier, which will be reused in annotation views
        let identifier = "Capital"

        // whether the annotation is 1 of the 5 Capital objects
        if annotation is Capital {
            // dequeue an annotation view from the map view's pool of unused views
            var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
            if annotationView == nil {
                // if there's no reusable view, create a new one using MKPinAnnotationView
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                // set canShowCallout to true, which triggers the popup with the city name
                annotationView!.canShowCallout = true

                // create a UIButton using the built-in .DetailDisclosure type.
                // this is a small blue "i" symbol with a circle around it
                let btn = UIButton(type: .DetailDisclosure)
                annotationView!.rightCalloutAccessoryView = btn
            } else {
                // if there's a reusable view, update the view to use a different annotation
                annotationView!.annotation = annotation
            }

            return annotationView
        }

        // if the annotation is not a Capital object, return nil so iOS uses a default view.
        return nil
    }

    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        // the annotation view contains the annotation property, which contains the Capital object
        let capital = view.annotation as! Capital

        // show the title and information of the capital via a UIAlertController
        let ac = UIAlertController(title: capital.title, message: capital.info, preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(ac, animated: true, completion: nil)
    }
}

