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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "Placemark"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            let label = UILabel()
            label.text = "Placeholder"
            label.textColor = UIColor.darkGray
            annotationView?.canShowCallout = true
            annotationView?.detailCalloutAccessoryView = label
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
}
