//
//  UserDefaultsHelperTests.swift
//  FinalProjectTests
//
//  Created by Nguyen-Trong Laura on 7/8/23.
//

import XCTest
@testable import FinalProject

final class UserDefaultsHelperTests: XCTestCase {
    
    var sut: UserDefaultsHelper?
    let recipeStub = RecipeStub()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = UserDefaultsHelper.defaults
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testUserDefaultsHelper_whenSaveRecipes_expectRecipesInDefault() {
        // GIVEN
        let recipes = [recipeStub.getStubRecipeLocalRecipe()]
        // WHEN
        sut?.saveSelectedRecipesIntoUserDefaults(recipes: recipes)
        let readRecipes = sut?.readSavedRecipesFromUserDefaults()
        // THEN
        XCTAssertEqual(readRecipes, recipes)
    }
    
}
