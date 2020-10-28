//
//  SectionView.swift
//  OrientaleNapp
//
//  Created by Francesco Bisogni on 23/10/2020.
//

import SwiftUI
import FirebaseDatabase

struct RowView: View {
    
    @State var item: Item
    @State var currentItems: String?
    
    var body: some View {
        HStack {
            Image(item.name.capitalized)
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)
            VStack(alignment: .leading){
                Text(NSLocalizedString("Pending \(item.name.capitalized)", comment: ""))
                    .fontWeight(.bold)
                Text(currentItems ?? "")
                    .font(.footnote)
                    .onAppear(perform: {
                        self.loadData()
                    })
            }
        }
    }
    
    func loadData() {
        var ref: DatabaseReference!
        ref = Database.database().reference(withPath: "\(self.item.name)s")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let currentDate = formatter.string(from: Date())
        
        ref.child("per day").child(currentDate).observe(DataEventType.value, with: { (snapshot) in
            let databaseData = snapshot.value as? Int ?? 0
            let localizedString = NSLocalizedString("pending \(item.name)s", comment: "")
            withAnimation {
                self.currentItems = "\(databaseData) \(localizedString)"
            }
        })
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(item: items[0])
    }
}
