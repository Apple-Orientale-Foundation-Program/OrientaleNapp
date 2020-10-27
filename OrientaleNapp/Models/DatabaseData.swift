//
//  DatabaseData.swift
//  OrientaleNapp
//
//  Created by Francesco Bisogni on 27/10/2020.
//

import Foundation
import SwiftUI

class DatabaseData: ObservableObject {
    @Published var totalAmount: Int?
    
    init(totalAmount: Int) {
        self.totalAmount = totalAmount
    }
}
