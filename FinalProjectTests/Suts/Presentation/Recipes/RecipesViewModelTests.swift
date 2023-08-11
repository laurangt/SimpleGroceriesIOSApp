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
    var ingredientStub = IngredientStub()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let mockRepository = MockRespository(recipesFetchedSuccess: true, recipeStub: recipeStub, ingredientStub: ingredientStub)
        sut = RecipesViewModel(repository: mockRepository)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testRecipesViewModel_whenfilterSelectedRecipes_expectSelectedRecipes() {
        //GIVEN
        let recipes = recipeStub.getStubSelectedNNotRecipes()
        //WHEN
        sut?.recipes = recipes
        sut?.filterSelectedRecipes()
        //THEN
        let expected = recipeStub.expectedStubSelected()
        XCTAssertTrue(sut?.selectedRecipes == expected)
    }
    
    func testRecipesViewModel_whenaddRecipeToSaved_expectSavedRecipesStored() {
        //GIVEN
        sut?.savedRecipes = []
        //WHEN
        let selectedRecipe = recipeStub.getStubRecipeLocalRecipe()
        sut?.addRecipeToSaved(recipe: selectedRecipe)
        //THEN
        XCTAssertTrue(sut?.savedRecipes.contains(selectedRecipe) == true)

    }

    func testRecipesViewModel_whenRemoveSelectedAfterAdded_expectRecipesNotSelected() {
        //GIVEN
        sut?.recipes = recipeStub.getStubSelectedNNotRecipes()
        //WHEN
        sut?.removeSelectedAfterAdded()
        //THEN
        sut?.recipes.forEach({ recipe in
            XCTAssertTrue(recipe.isSelected == false)
        })

    }
    
}
