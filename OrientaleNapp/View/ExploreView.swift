//
//  ExploreView.swift
//  OrientaleNapp
//
//  Created by Luca Pariota on 22/10/2020.
//

import SwiftUI

struct ExploreView: View {
        var body: some View {
            NavigationView {
                Form {
                    Section {
                        NavigationLink(
                            destination: MapView(),
                            label: {
                                Rigasettings(nomeImmagine: "coffee", pendedItem: "Pending CoMffee", totalPended: "100 pended coffees")
                            })
                        
                    }
                    
                    Section {
                        NavigationLink(
                            destination: MapView(),
                            label: {
                                Rigasettings(nomeImmagine: "pizza", pendedItem: "Pending Pizza", totalPended: "100 pended pizzas")
                            })
                    }
                    
                    Section {
                        NavigationLink(
                            destination: MapView(),
                            label: {
                                Rigasettings(nomeImmagine: "toy", pendedItem: "Pending Toy", totalPended: "100 pended toys")
                            })
                    }
                    
                    Section {
                        NavigationLink(
                            destination: MapView(),
                            label: {
                                Rigasettings(nomeImmagine: "book", pendedItem: "Pending Book", totalPended: "100 pended books")
                            })
                    }
                    
                }
                .navigationTitle("Explore")
                .navigationBarItems(trailing: Button("+") {
                    
                })
                
                
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
                .frame(width: 50, height: 50)
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
