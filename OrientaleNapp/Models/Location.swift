//
//  Annotation.swift
//  OrientaleNapp
//
//  Created by Francesco Bisogni on 25/10/2020.
//

import Foundation

struct Location: Codable, Identifiable {
    let id = UUID()
    
    let name: String
    let latitude: Double
    let longitude: Double
    
    private enum CodingKeys: String, CodingKey { case name, latitude, longitude }
}
