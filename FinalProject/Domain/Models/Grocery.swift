//
//  Grocery.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import Foundation

struct Grocery: Identifiable  {
    let id = UUID()
    let ingredient: String
    let amount: Int
    let unit: String
    var done: Bool = false
}
