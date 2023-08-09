//
//  RepositoryImpl.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 3/8/23.
//

import Foundation

final class RepositoryImpl: RepositoryProtocol {
    
    private let remoteDataSource: RemoteDataSourceProtocol
    
    init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    // MARK: recipes Api methods
    func getRecipes(query: String) async throws -> [LocalRecipe]? {
        guard let remoteRecipeData = try? await remoteDataSource.getRecipes(query: query) else {
            return []
        }
        return mapperLocalRecipes(recipes: remoteRecipeData)
    }
    
    func mapperLocalRecipes(recipes: [RecipeModel]) -> [LocalRecipe] {
        return recipes.map {
            LocalRecipe(label: $0.recipe.label, image: $0.recipe.image, localIngredients: mapperIngredientToGrocery(ingredients: $0.recipe.ingredients), cuisineType: $0.recipe.cuisineType)
        }
    }
    //TODO: change name to localingredient and delete grocerymodel
    func mapperIngredientToGrocery(ingredients: [RemoteIngredient]) -> [LocalIngredient] {
        return ingredients.map { LocalIngredient(remoteIngredient: RemoteIngredient(food: $0.food, quantity: $0.quantity, image: $0.image, foodId: $0.foodId), isCompleted: false) }
    }
    
}
