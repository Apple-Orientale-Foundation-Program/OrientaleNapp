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
        
        let item = "\(view.annotation!.subtitle!!)s"
        
        var ref: DatabaseReference!
        ref = Database.database().reference(withPath: item)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let currentDate = formatter.string(from: Date())
        
        ref.child("per location").observeSingleEvent(of: .value, with: { (snapshot) in
            if let value = snapshot.value as? [String: [String: Int]] {
                let location = view.annotation!.title!!
                let label = UILabel()
                label.text = "\(value[location] != nil ? value[location]![currentDate, default: 0] : 0) pending \(item)"
                label.textColor = UIColor.darkGray
                view.detailCalloutAccessoryView = label
            }
        })
    }
}
