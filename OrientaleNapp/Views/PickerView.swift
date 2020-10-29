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
    @State private var selectedPlace: Location?
    @State private var selectedItem = 0
    @State var numberOfItems: Int = 1
    @State private var showAlert = false
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(
                    header: Text("Donation type")
                ) {
                    HStack {
                        Image(items[selectedItem].name.capitalized)
                        
                        Picker(
                            selection: $selectedItem,
                            label: Text("")
                        ) {
                            ForEach(0 ..< items.count) {
                                Text(NSLocalizedString(items[$0].name.capitalized, comment: ""))
                                    .foregroundColor(
                                        $0 == selectedItem ?
                                        Color(.black) :
                                        Color(.gray)
                                    )
                            }
                        }
                        .onChange(of: selectedItem) { _ in
                            selectedPlace = nil
                        }
                    }
                }
                
                Section(
                    header: Text("Location")
                ) {
                    NavigationLink(
                        destination: SearchView(
                            selectedItem: items[selectedItem].name.capitalized,
                            selectedPlace: $selectedPlace
                        )
                    ) {
                        HStack {
                            HStack {
                                Image(systemName: "mappin.circle.fill")
                                    .resizable()
                                    .frame(width: 30.0, height: 30.0)
                                    .foregroundColor(.red)
                                Text(
                                    selectedPlace == nil ?
                                    NSLocalizedString("Add place", comment: "") :
                                    selectedPlace!.title
                                )
                                    .font(.title3)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                
                                
                            }
                            .padding(.all, 27.0)
                        }
                    }
                }
                
                Section(
                    header: Text("Number of Items")
                ) {
                    Stepper(
                        value: $numberOfItems,
                        in: 1...50,
                        label: {
                            Text ("\(numberOfItems)")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                        }
                    )
                        .padding(.all, 27.0)
                        .foregroundColor(.black)
                }
            }
            .navigationBarTitle(
                Text("Pended items"),
                displayMode: .inline
            )
            .navigationBarItems(
                leading: Button(action: {
                    self.showPickerView = false
                }) {
                    Text("Cancel").bold()
                },
                trailing: Button(action: {
                    self.showPickerView = false
                    updateDatabase()
                }) {
                    Text("Done").bold()
                }
                .disabled(selectedPlace == nil)
                .accentColor(
                    selectedPlace == nil ?
                    .gray :
                    Color("newColor7")
                )
            )
        }
        .accentColor(Color("newColor7"))
    }
    
    func updateDatabase() {
        let path = "\(items[self.selectedItem].name)s"
        var ref: DatabaseReference!
        ref = Database.database().reference(withPath: path)
        
        ref.runTransactionBlock({ (currentData: MutableData) -> TransactionResult in
            if var post = currentData.value as? [String: [String: Any]] {
                
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                let currentDate = formatter.string(from: Date())
                
                var totalCounter = post["per day"]![currentDate] as? Int ?? 0
                totalCounter += self.numberOfItems
                
                var locationStats = post["per location"]![String(self.selectedPlace!.id)] as? [String: Int] ?? [currentDate: 0]
                locationStats[currentDate, default: 0] += self.numberOfItems
                
                post["per day"]![currentDate] = totalCounter as Any?
                post["per location"]![String(self.selectedPlace!.id)] = locationStats as Any?
                
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
