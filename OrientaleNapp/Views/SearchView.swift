//
//  SearchView.swift
//  OrientaleNapp
//
//  Created by Khrystyna Shala on 27/10/2020.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @ObservedObject private var viewModel = ViewModel()
    var selectedItem: String
    @Binding var selectedPlace: Location?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            TextField("Search places...", text: $searchText)
            List(viewModel.locations.filter { $0.title.hasPrefix(searchText) && $0.item == selectedItem.lowercased()
            }) { place in
                PlaceRow(place: place).onTapGesture(perform: {
                    selectedPlace = place
                    presentationMode.wrappedValue.dismiss()
                })
            }
        }.padding()
    }
}

struct PlaceRow: View {
    var place: Location
    
    var body: some View {
        HStack {
            Text("\(place.title)")
            Spacer()
            if place.distance != nil {
                Image(systemName: "location.fill").foregroundColor(.secondary)
                Text("\(place.distance ?? 0, specifier: "%.2f") km").foregroundColor(.secondary)
            }
        }
    }
}
