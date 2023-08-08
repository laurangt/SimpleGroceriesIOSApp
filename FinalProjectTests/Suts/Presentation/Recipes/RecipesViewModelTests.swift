//
//  RecipesViewModelTests.swift
//  FinalProjectTests
//
//  Created by Nguyen-Trong Laura on 7/8/23.
//

import XCTest
@testable import FinalProject

final class RecipesViewModelTests: XCTestCase {

    var sut: RecipesViewModel?
    var recipeStub = RecipeStub()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let mockRepository = MockRespository(recipesFetchedSuccess: true, recipeStub: recipeStub)
        sut = RecipesViewModel(repository: mockRepository)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

//    func testRecipesViewModel_whenSearchingRecipesWQuery_expectLocalRecipes() async throws {
//        //GIVEN
//        let query = "pizza"
//        let recipes = [recipeStub.getStubRecipeLocalRecipe()]
//        //WHEN
//        var searchedRecipes = await sut?.searchRecipes(query: query)
//        //THEN
//        XCTAssertTrue((sut?.recipes.count)! > 0)
//
//    }
    



}
