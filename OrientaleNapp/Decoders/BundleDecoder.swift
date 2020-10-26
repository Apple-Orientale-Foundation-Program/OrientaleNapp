//
//  BundleDecoder.swift
//  OrientaleNapp
//
//  Created by Francesco Bisogni on 25/10/2020.
//

import Foundation

extension Bundle {
    
    func decode(_ file: String) -> [Location] {
        
        guard let url = self.url(forResource: file, withExtension: "json") else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode([Location].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
