//
//  RepositoryTests.swift
//  FinalProjectTests
//
//  Created by Nguyen-Trong Laura on 7/8/23.
//

import XCTest
@testable import FinalProject

final class RepositoryTests: XCTestCase {
    
    var sut: RepositoryProtocol?
    let recipeStub = RecipeStub()
    let ingredientStub = IngredientStub()

    override func setUpWithError() throws {
        try super.setUpWithError()
        let remoteDataSource = MockRemoteDataSource(recipesFetchedSuccess: true, recipeStub: recipeStub)
        sut = RepositoryImpl(remoteDataSource: remoteDataSource)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testRepository_whenGetRecipesWithMockRemoteGetRecipesSuccessful_expectRecipes() async throws {
        // GIVEN
        let query = "pasta"
        let mockRemoteDataSource = MockRemoteDataSource(recipesFetchedSuccess: true, recipeStub: recipeStub)
        sut = RepositoryImpl(remoteDataSource: mockRemoteDataSource)
        // WHEN
        let recipes = try await sut?.getRecipes(query: query)
        //THEN
        XCTAssertEqual(recipes!.count, 1)
    }

//    TODO: map function
    func testRepository_whenMapperRemoteRecipe_expectLocalRecipe() {
        // GIVEN
        let mockRemoteDataSource = MockRemoteDataSource(recipesFetchedSuccess: true, recipeStub: recipeStub)
        sut = RepositoryImpl(remoteDataSource: mockRemoteDataSource)
        let recipes = [recipeStub.getStubRecipeRecipeModel()]
        // WHEN
        let mappedRecipe = sut?.mapperLocalRecipes(recipes: recipes)
        // THEN
        XCTAssertTrue(type(of: mappedRecipe) == [LocalRecipe].self)
    }

    
    func testRepository_whenMapperRemoteIngredient_expectLocalIngredient() {
        // GIVEN
        let mockRemoteDataSource = MockRemoteDataSource(recipesFetchedSuccess: true, recipeStub: recipeStub)
        sut = RepositoryImpl(remoteDataSource: mockRemoteDataSource)
        let remoteIngredients = [ingredientStub.getStubRemoteIngredients()]
        // WHEN
        let mappedIngredients = sut?.mapperRemoteIngredientToLocalIngredient(ingredients: remoteIngredients)
        // THEN
        XCTAssertTrue(type(of: mappedIngredients) == [LocalIngredient].self)
    }
}
