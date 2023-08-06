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
    let ingredients: [IngredientModel]
    let cuisineType: [String]
}

struct LocalRecipe: Identifiable {
    let id = UUID()
    var isSelected: Bool = false
    let remoteRecipe: RemoteRecipe
}

struct IngredientModel: Codable {
    let text: String
    let image: URL?
}


