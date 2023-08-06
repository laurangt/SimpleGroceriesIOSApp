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
    let recipe: RemoteRecipe
}

struct RemoteRecipe: Codable {
    let label: String
    let image: URL
    let ingredients: [Ingredient]
    let cuisineType: [String]
}

struct LocalRecipe: Codable, Identifiable {
    var id = UUID()
    var isSelected: Bool = false
    let remoteRecipe: RemoteRecipe
}

struct Ingredient: Codable, Identifiable {
    let food: String
    let quantity: Float
    var measure: String?
    let image: URL?
    let foodId: String
    var id: String { foodId }
}


