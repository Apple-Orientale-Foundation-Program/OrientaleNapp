//
//  SectionView.swift
//  OrientaleNapp
//
//  Created by Francesco Bisogni on 23/10/2020.
//

import SwiftUI

struct RowView: View {
    
    @State var item: Item
    
    var body: some View {
        HStack {
            Image(item.name.capitalized)
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)
            VStack{
                Text("Pending \(item.name.capitalized)")
                    .fontWeight(.bold)
                Text("100 pending \(item.name)s")
                    .font(.footnote)
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(item: items[0])
    }
}
