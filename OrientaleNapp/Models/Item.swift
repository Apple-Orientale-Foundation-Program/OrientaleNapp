//
//  Item.swift
//  OrientaleNapp
//
//  Created by Francesco Bisogni on 23/10/2020.
//

import Foundation

struct Item: Identifiable {
    var id = UUID()
    
    var name: String
}

var items = [
    Item(name: "coffee"),
    Item(name: "pizza"),
    Item(name: "toy"),
    Item(name: "book")
]
