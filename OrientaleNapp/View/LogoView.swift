//
//  LogoView.swift
//  OrientaleNapp
//
//  Created by Luca Pariota on 22/10/2020.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.white]), startPoint: .top, endPoint: .center)
                .edgesIgnoringSafeArea(.vertical)
            
            HStack {
                Text("NapPending")
                    .fontWeight(.light)
                    .frame(width: 300, height: 330, alignment: .top)
                    .font(.system(size: 45, design: .default))
                }
            
            Image("mani")
                .resizable()
                .frame(width: 200, height: 180, alignment: .center)
                .shadow(radius: 10)
        
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
}
