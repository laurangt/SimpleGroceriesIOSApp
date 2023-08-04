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
    
    func getRecipes(query: String) async throws -> [LocalRecipe]? {
        guard let remoteRecipeData = try? await remoteDataSource.getRecipes(query: query) else {
            return []
        }
        return mapperLocalRecipes(recipes: remoteRecipeData)
    }
    
    func mapperLocalRecipes(recipes: [RecipeModel]) -> [LocalRecipe] {
        return recipes.map {
            LocalRecipe(id: UUID(), remoteRecipe: RemoteRecipe(label: $0.recipe.label, image: $0.recipe.image, ingredients: $0.recipe.ingredients, cuisineType: $0.recipe.cuisineType))
        }
    }
    
    
    
    
    
}
