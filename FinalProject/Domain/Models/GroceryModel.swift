//
//  Grocery.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import Foundation

struct GroceryModel: Codable, Identifiable  {
    var id = UUID()
    let ingredient: LocalIngredient
    var isCompleted: Bool
}
