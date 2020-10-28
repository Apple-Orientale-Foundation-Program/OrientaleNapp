//
//  Coordinator.swift
//  OrientaleNapp
//
//  Created by Francesco Bisogni on 22/10/2020.
//

import Foundation
import MapKit
import FirebaseDatabase

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
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        if let annotation = view.annotation as? PlaceAnnotation {
            let item = "\(annotation.item!)s"
            let location = annotation.id!
            
            var ref: DatabaseReference!
            ref = Database.database().reference(withPath: item)
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let currentDate = formatter.string(from: Date())
            
            ref.child("per location").child(String(location)).child(currentDate).observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as? Int ?? 0
                let label = UILabel()
                label.text = "\(value) pending \(item)"
                label.textColor = UIColor.darkGray
                view.detailCalloutAccessoryView = label
            })
        }
    }
}
