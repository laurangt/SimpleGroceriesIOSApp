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
    var ingredients: [RemoteIngredient]
    let cuisineType: [String]
}

struct LocalRecipe: Codable, Identifiable, Equatable {
    static func == (lhs: LocalRecipe, rhs: LocalRecipe) -> Bool {
        lhs.isSelected == rhs.isSelected
    }
    
    var id = UUID()
    var isSelected: Bool = false
//    var remoteRecipe: RemoteRecipe
    let label: String
    var image: URL?
    var localIngredients: [LocalIngredient]
    let cuisineType: [String]
}

struct RemoteIngredient: Codable {
    let food: String
    let quantity: Float
    var measure: String?
    let image: URL?
    let foodId: String
    //TODO: id same if food multiple itme or ingredient multiple time
//    var id = UUID()
}

struct LocalIngredient: Codable, Identifiable {
    let remoteIngredient: RemoteIngredient
    var isCompleted: Bool
    var id = UUID()
}

