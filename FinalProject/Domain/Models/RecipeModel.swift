//
//  RecipeModel.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import Foundation

struct RecipeModel{
    let name: String
    let ingredients: [Grocery]
    let description: String
    let servings: Int?
    let cookingTime: String?
}
