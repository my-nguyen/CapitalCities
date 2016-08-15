//
//  Capital.swift
//  CapitalCities
//
//  Created by My Nguyen on 8/15/16.
//  Copyright © 2016 My Nguyen. All rights reserved.
//

import UIKit
import MapKit

// with map annotations, you can't use structs, and you must inherit from NSObject
// because it needs to interact with Objective C code
class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String

    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
