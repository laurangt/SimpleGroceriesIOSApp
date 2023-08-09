//
//  MockRepository.swift
//  FinalProjectTests
//
//  Created by Nguyen-Trong Laura on 7/8/23.
//

import Foundation
@testable import FinalProject

final class MockRespository: RepositoryProtocol {

    let recipesFetchedSuccess: Bool
    let recipeStub: RecipeStub
    let ingredientStub: IngredientStub
    
    init(recipesFetchedSuccess: Bool = false, recipeStub: RecipeStub, ingredientStub: IngredientStub) {
        self.recipesFetchedSuccess = recipesFetchedSuccess
        self.recipeStub = recipeStub
        self.ingredientStub = ingredientStub
    }
    
    
    func getRecipes(query: String) async throws -> [FinalProject.LocalRecipe]? {
        switch recipesFetchedSuccess {
        case true:
            return [recipeStub.getStubRecipeLocalRecipe()]
        case false:
            return []
        }
    }
    
 
    func mapperLocalRecipes(recipes: [FinalProject.RecipeModel]) -> [FinalProject.LocalRecipe] {
        switch recipesFetchedSuccess {
        case true:
            return [recipeStub.getStubRecipeLocalRecipe()]
        case false:
            return []
        }
    }
    
    func mapperRemoteIngredientToLocalIngredient(ingredients: [FinalProject.RemoteIngredient]) -> [FinalProject.LocalIngredient] {
        switch recipesFetchedSuccess {
        case true:
            return [ingredientStub.getStubLocalIngredient()]
        case false:
            return []
        }
    }
}
