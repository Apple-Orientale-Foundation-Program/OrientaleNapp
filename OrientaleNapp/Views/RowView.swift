//
//  SectionView.swift
//  OrientaleNapp
//
//  Created by Francesco Bisogni on 23/10/2020.
//

import SwiftUI
import FirebaseDatabase

struct RowView: View {
    
    @State var item: Item?
    @State var currentItems: String?
    
    var body: some View {
        HStack {
            Image(item?.name.capitalized ?? "map")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)
            VStack(alignment: .leading){
                Text(
                    NSLocalizedString(
                        item != nil ?
                        "Pending \(item!.name.capitalized)s" :
                        "All Items",
                        comment: ""
                    )
                )
                    .fontWeight(.bold)
                Text(currentItems ?? "")
                    .font(.footnote)
                    .onAppear(perform: {
                        if item != nil {
                            self.loadData()
                        }
                    })
            }
        }
    }
    
    func loadData() {
        var ref: DatabaseReference!
        ref = Database.database().reference(withPath: "\(self.item!.name)s")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let currentDate = formatter.string(from: Date())
        let startDate = Date(timeIntervalSinceNow: -604800)
        
        ref.child("per day").observe(DataEventType.value, with: { (snapshot) in
            if let databaseDict = snapshot.value as? [String: Int] {
                let today = databaseDict[currentDate] ?? 0
                var thisWeek = 0
                var date = startDate
                while date.compare(Date()) != .orderedDescending {
                    var dateComponent = DateComponents()
                    dateComponent.day = 1
                    date = Calendar.current.date(byAdding: dateComponent, to: date)!
                    let formattedDate = formatter.string(from: date)
                    thisWeek += databaseDict[formattedDate] ?? 0
                }
                let localizedString = """
                    \(NSLocalizedString("Today", comment: "")): \(today)
                    \(NSLocalizedString("This week", comment: "")): \(thisWeek)
                    """
                withAnimation {
                    self.currentItems = localizedString
                }
            }
        })
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(item: items[0])
    }
}
