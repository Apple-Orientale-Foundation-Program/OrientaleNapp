//
//  PickerView.swift
//  OrientaleNapp
//
//  Created by Simona Menale on 23/10/2020.
//

import SwiftUI

struct PickerView: View {
    
    var items = ["Coffee", "Pizza", "Toy", "Book"]
    @State private var selectedItem = 0
    @State var numberOfItems: Int = 0
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Text ("You selected: \(items[selectedItem])")
                    .font(.title3)
                    .fontWeight(.regular)
                    .padding()
                    .foregroundColor(Color.black)
                
                
                Picker(selection: $selectedItem, label: Text("")) {
                    
                    ForEach(0 ..< items.count) {
                        Text(self.items[$0])
                    }
                }
                
                
                Image("\(items[selectedItem])")
                
                HStack {
                    Image("")
                        .resizable()
                        .padding([.leading, .bottom, .trailing])
                        .scaledToFit()
                    
                    Image("")
                        .resizable()
                        .padding([.leading, .bottom, .trailing])
                        .scaledToFit()
                    Image("")
                        .resizable()
                        .padding([.leading, .bottom, .trailing])
                        .scaledToFit()
                    Image("")
                        .resizable()
                        .padding([.leading, .bottom, .trailing])
                        .scaledToFit()
                }
                
                
                Stepper(value: $numberOfItems, in: 0...50, label:{
                    Text ("Number of items: \(numberOfItems)")
                }).padding(.all)
                
            }
            
            .navigationBarItems(leading: Button("Cancel") {}, trailing: Button("Done") {}).foregroundColor(.black)
            
        
        } // fine NavigationView
    
    }
    
    
    
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
