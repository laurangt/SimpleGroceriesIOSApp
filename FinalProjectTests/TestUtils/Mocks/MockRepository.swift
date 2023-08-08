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
    
    init(recipesFetchedSuccess: Bool = false, recipeStub: RecipeStub) {
        self.recipesFetchedSuccess = recipesFetchedSuccess
        self.recipeStub = recipeStub
    }
    
    
    func getRecipes(query: String) async throws -> [FinalProject.LocalRecipe]? {
        switch recipesFetchedSuccess {
        case true:
            return [recipeStub.getStubRecipeLocalRecipe()]
        case false:
            return []
        }
    }
}
