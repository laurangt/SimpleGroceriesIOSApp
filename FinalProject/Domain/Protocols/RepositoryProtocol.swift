//
//  RepositoryProtocol.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 3/8/23.
//

import Foundation

protocol RepositoryProtocol {
    func getRecipes(query: String) async throws -> [LocalRecipe]?
    func mapperLocalRecipes(recipes: [RecipeModel]) -> [LocalRecipe]
    func mapperIngredientToGrocery(ingredients: [RemoteIngredient]) -> [LocalIngredient]

}
