//
//  Mapkit.swift
//  OrientaleNapp
//
//  Created by Luisa Porfido on 23/10/2020.
//

import SwiftUI
import MapKit

struct MapView2: View {
        
        @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D (latitude: 40.8518, longitude: 14.2681), latitudinalMeters: 10000, longitudinalMeters: 10000)
        @State var tracking: MapUserTrackingMode = .follow
        
        var body: some View{
            
            VStack{
                
                Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $tracking)
            }
        

        }
    }


struct MapView2_Previews: PreviewProvider {
    static var previews: some View {
        MapView2()
    }
}


    
    

