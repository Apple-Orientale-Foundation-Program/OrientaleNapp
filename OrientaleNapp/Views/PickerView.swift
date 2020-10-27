//
//  PickerView.swift
//  OrientaleNapp
//
//  Created by Simona Menale on 23/10/2020.
//

import SwiftUI
import FirebaseDatabase

struct PickerView: View {
    @Binding var showPickerView: Bool
    var items = ["Coffee", "Pizza", "Toy", "Book"]
    @State var selectedPlace: Locations?
    @State private var selectedItem = 0
    @State var numberOfItems: Int = 1
    
    var body: some View {
        
        
        
        NavigationView {
            
            VStack {
                NavigationLink (
                    destination: SearchView(item: $selectedPlace),
                    label: {
                        Text("Add place")
                            .font(.title3)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            
                    })
                    .padding(.all, 27.0)

                
                Picker(selection: $selectedItem, label: Text("")) {
                    
                    ForEach(0 ..< items.count) {
                        Text(self.items[$0]).foregroundColor($0 == selectedItem ? Color("newColor7"): Color("newColor1"))
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
                
                Spacer ()
                    .frame(height: 0.0)
                
                Text ("You selected \(items[selectedItem])")
                    .font(.title3)
                    .fontWeight(.regular)
                    .padding()
                    .foregroundColor(Color.black)
                
                Spacer ()
                    .frame(height: 40.0)
                
                Stepper(value: $numberOfItems, in: 1...50, label:{
                    Text ("Number of items: \(numberOfItems)")
                        .font(.title3)
                }).padding(.all, 27.0)
                .foregroundColor(.black)
                
            }
            
            .navigationBarTitle(Text("Pended Items"), displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.showPickerView = false
            })  {Text("Cancel").bold()}
            ,trailing: Button(action: {
                self.showPickerView = false
                addCoffee()
            }) {
                Text("Done").bold()
            }).foregroundColor(Color("newColor7"))
            
        }// fine NavigationView
        
    }
}

func addCoffee() {
    var ref: DatabaseReference!
    ref = Database.database().reference()
    
    ref.runTransactionBlock({ (currentData: MutableData) -> TransactionResult in
        if var post = currentData.value as? [String: Int] {
            post["coffees"]! += 1
            currentData.value = post
            
            return TransactionResult.success(withValue: currentData)
        }
        return TransactionResult.success(withValue: currentData)
    }) { (error, committed, snapshot) in
        if let error = error {
            print(error.localizedDescription)
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(showPickerView: .constant(true))
    }
}
