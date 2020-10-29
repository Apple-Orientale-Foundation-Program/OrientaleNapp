//
//  ExploreView.swift
//  OrientaleNapp
//
//  Created by Luca Pariota on 22/10/2020.
//

import SwiftUI

struct ExploreView: View {
    
    @State var showPickerView = false
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(items) { item in
                    NavigationLink(
                        destination:
                            MapView(item: item)
                                .navigationBarTitleDisplayMode(.inline),
                        label: {
                            RowView(item: item)
                        }
                    )
                }
                NavigationLink(
                    destination:
                        MapView()
                            .navigationBarTitleDisplayMode(.inline),
                    label: {
                        RowView()
                    }
                )
            }
            .navigationBarTitle("Explore")
            .navigationBarItems(
                trailing: Button(
                    action: {
                        self.showPickerView.toggle()
                    }
                ) {
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(Color("newColor7"))
                        .font(.title)
                }
            )
        }
        .sheet(isPresented: $showPickerView) {
            PickerView(showPickerView: self.$showPickerView)
        }
        .accentColor(Color("newColor7"))
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
