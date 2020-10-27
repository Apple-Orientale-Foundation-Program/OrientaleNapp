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
    @State private var selectedPlace: Locations?
    @State private var selectedItem = 0
    @State var numberOfItems: Int = 1
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                NavigationLink (
                    destination: SearchView(selectedItem: $selectedPlace)
                ) {
                    Text(selectedPlace == nil ?
                            "Add place" :
                            selectedPlace!.title)
                        .font(.title3)
                        .foregroundColor(.black)
                }
                
                Picker(
                    selection: $selectedItem,
                    label: Text("")
                ) {
                    ForEach(0 ..< items.count) {
                        Text(self.items[$0])
                            .foregroundColor($0 == selectedItem ?
                                Color("newColor7") :
                                Color("newColor1"))
                    }
                }
                
                Image("\(items[selectedItem])")
                
                Spacer()
                    .frame(height: 0.0)
                
                Text ("You selected \(items[selectedItem])")
                    .font(.title3)
                    .fontWeight(.regular)
                    .padding()
                    .foregroundColor(Color.black)
                
                Spacer()
                    .frame(height: 40.0)
                
                Stepper(
                    value: $numberOfItems,
                    in: 1...50,
                    label: {
                        Text ("Number of items: \(numberOfItems)")
                            .font(.title3)
                    })
                    .padding(.all, 27.0)
                    .foregroundColor(.black)
            }
            .navigationBarTitle(
                Text("Pended items"),
                displayMode: .inline
            )
            .navigationBarItems(
                leading: Button(action: {
                    self.showPickerView = false
                } ) {
                    Text("Cancel").bold()
                },
                trailing: Button(action: {
                    self.showPickerView = false
                    updateDatabase()
                } ) {
                    Text("Done").bold()
                }
            )
            .foregroundColor(Color("newColor7"))
        }
    }
    
    func updateDatabase() {
        let path = "\(self.items[self.selectedItem].lowercased())s"
        var ref: DatabaseReference!
        ref = Database.database().reference(withPath: path)
        
        ref.runTransactionBlock({ (currentData: MutableData) -> TransactionResult in
            if var post = currentData.value as? [String: [String: Any]] {
                
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                let currentDate = formatter.string(from: Date())
                
                var totalCounter = post["per day"]![currentDate] as? Int ?? 0
                totalCounter += self.numberOfItems
                
                var locationStats = post["per location"]![self.selectedPlace!.title] as? [String: Int] ?? [currentDate: 0]
                locationStats[currentDate, default: 0] += self.numberOfItems
                
                post["per day"]![currentDate] = totalCounter as Any?
                post["per location"]![self.selectedPlace!.title] = locationStats as Any?
                
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
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(showPickerView: .constant(true))
    }
}
