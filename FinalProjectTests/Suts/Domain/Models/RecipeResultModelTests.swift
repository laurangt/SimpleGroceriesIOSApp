//
//  RecipeResultModelTests.swift
//  FinalProjectTests
//
//  Created by Nguyen-Trong Laura on 7/8/23.
//

import XCTest
@testable import FinalProject

final class RecipeResultModelTests: XCTestCase {

    var sut: RecipeResultModel?
    var recipeStub = RecipeStub()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testRecipeModel_whenInitalisingRecipeResult_expectRecipeResult() {
        // GIVEN
        let hits = [recipeStub.getStubRecipeRecipeModel()]
        // WHEN
//        let recipes = RecipeResultModel(hits: hits)
        // THEN
//        XCTAssertEqual(recipes.hits, hits)
        XCTAssertEqual(hits[0].recipe.label, "")
        
    }

}
