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
                    Section {
                        NavigationLink(
                            destination: MapView()
                                .navigationBarTitleDisplayMode(.inline),
                            label: {
                                Rigasettings(nomeImmagine: "Coffee", pendedItem: "Pending Coffee", totalPended: "100 pended coffees")
                            })
                        
                    }
                    
                    Section {
                        NavigationLink(
                            destination: MapView()
                                .navigationBarTitleDisplayMode(.inline),
                            label: {
                                Rigasettings(nomeImmagine: "Pizza", pendedItem: "Pending Pizza", totalPended: "100 pended pizzas")
                            })
                    }
                    
                    Section {
                        NavigationLink(
                            destination: MapView()
                                .navigationBarTitleDisplayMode(.inline),
                            label: {
                                Rigasettings(nomeImmagine: "Toy", pendedItem: "Pending Toy", totalPended: "100 pended toys")
                            })
                    }
                    
                    Section {
                        NavigationLink(
                            destination: MapView()
                                .navigationBarTitleDisplayMode(.inline),
                            label: {
                                Rigasettings(nomeImmagine: "Book", pendedItem: "Pending Book", totalPended: "100 pended books")
                            })
                    }
                    
                }
                
               
                
                .navigationBarTitle("Explore")
                .navigationBarItems(trailing: Button(action: {
                    self.showPickerView.toggle()
                    }) {
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(.orange)
                        .frame(width: 30, height: 30)
                    
                }
            )

            }.sheet(isPresented: $showPickerView) {
              PickerView(showPickerView: self.$showPickerView)
            }
        }
    }

    struct ExploreView_Previews: PreviewProvider {
        static var previews: some View {
            ExploreView()
        }
    }

struct Rigasettings: View {
    
    var nomeImmagine = ""
    var pendedItem = ""
    var totalPended = ""
    
    var body: some View {
        HStack{
            Image(nomeImmagine)
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)
            VStack{
                Text(pendedItem)
                    .fontWeight(.bold)
                Text(totalPended)
                    .font(.footnote)
            }
        }
        
    }
}
