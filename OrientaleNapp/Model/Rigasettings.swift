//
//  Rigasettings.swift
//  OrientaleNapp
//
//  Created by Luca Pariota on 22/10/2020.
//

import Foundation

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


