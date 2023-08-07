//
//  Grocery.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import Foundation

struct GroceryModel: Decodable, Identifiable  {
    var id = UUID()
    let ingredient: Ingredient
    var isCompleted: Bool = false
}
