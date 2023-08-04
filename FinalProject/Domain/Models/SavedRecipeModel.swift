//
//  SavedRecipeModel.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 3/8/23.
//

import Foundation

struct SavedRecipeModel: Identifiable{
    let id = UUID()
    let name: String
    let servings: Int
    let cookingTime: String
}
