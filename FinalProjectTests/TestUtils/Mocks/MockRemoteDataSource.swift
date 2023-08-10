//
//  MockRemoteDataSource.swift
//  FinalProjectTests
//
//  Created by Nguyen-Trong Laura on 7/8/23.
//

import Foundation
@testable import FinalProject

final class MockRemoteDataSource: RemoteDataSourceProtocol {
    let recipesFetchedSuccess: Bool
    let recipeStub: RecipeStub
    
    init(recipesFetchedSuccess: Bool = false, recipeStub: RecipeStub) {
        self.recipesFetchedSuccess = recipesFetchedSuccess
        self.recipeStub = recipeStub
    }
    
    
    func getRecipes(query: String) async throws -> [FinalProject.RecipeModel]? {
        switch recipesFetchedSuccess {
        case true:
            return [recipeStub.getStubRecipeRecipeModel()]
        case false:
            return []
        }
    }
    
   
}
