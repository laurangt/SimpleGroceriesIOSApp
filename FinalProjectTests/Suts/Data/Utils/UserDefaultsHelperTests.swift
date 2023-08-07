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
    let recipeStub: RecipeStub? = nil
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = UserDefaultsHelper.defaults
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testUserDefaultsHelper_whenSaveRecipes_recipesInDefault() {
//
//        // GIVEN
//        sut?.saveSelectedRecipesIntoUserDefaults(recipes: [recipeStub?.getStubRecipe()])
//
//        // WHEN
//        let recipe = sut?.readSavedRecipesFromUserDefaults()
//
//        // THEN
//        XCTAssertEqual(recipe, [recipeStub?.getStubRecipe()])
    }
}
