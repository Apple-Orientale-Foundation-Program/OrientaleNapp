//
//  SheetView.swift
//  OrientaleNapp
//
//  Created by Luca Pariota on 23/10/2020.
//

import SwiftUI

struct SheetView: View {
    var body: some View {
        NavigationView {
            Text("List of notifications")
                .navigationBarTitle(Text("Pended Items"), displayMode: .inline)
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
