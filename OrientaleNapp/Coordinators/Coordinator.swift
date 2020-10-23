//
//  Coordinator.swift
//  OrientaleNapp
//
//  Created by Francesco Bisogni on 22/10/2020.
//

import Foundation
import MapKit

final class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: MapView
    
    init(_ control: MapView) {
        self.control = control
    }
}
