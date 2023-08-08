//
//  RecipeModel.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import Foundation

struct RecipeResultModel: Decodable {
    let hits: [RecipeModel]
}

struct RecipeModel: Codable{
    var recipe: RemoteRecipe
}

struct RemoteRecipe: Codable {
    let label: String
    let image: URL
    var ingredients: [Ingredient]
    let cuisineType: [String]
}

struct LocalRecipe: Codable, Identifiable {
    var id = UUID()
    var isSelected: Bool = false
    var remoteRecipe: RemoteRecipe
}

struct Ingredient: Codable, Identifiable {
    let food: String
    let quantity: Float
    var measure: String?
    let image: URL?
    let foodId: String
    //TODO: id same if food multiple itme or ingredient multiple time
    var id: String { foodId }
}


