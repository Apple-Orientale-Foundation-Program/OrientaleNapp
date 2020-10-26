//
//  MapView.swift
//  OrientaleNapp
//
//  Created by Francesco Bisogni on 22/10/2020.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    // commented out for now
    //@ObservedObject private var locationManager = LocationManager()
    
    @State var item: Item
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView(frame: .zero)
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        /*let coordinate = self.locationManager.location != nil ?
            self.locationManager.location!.coordinate :
            CLLocationCoordinate2D()*/
        let coordinate = CLLocationCoordinate2D(latitude: 40.8518, longitude: 14.2681)
        let span = MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
        let locations = Bundle.main.decode ("\(item.name)")
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            uiView.addAnnotation(annotation)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(item: items[0])
    }
}
