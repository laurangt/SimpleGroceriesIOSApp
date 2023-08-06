//
//  RecipesViewModel.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 3/8/23.
//

import Foundation

final class RecipesViewModel: ObservableObject {
    private let repository: RepositoryProtocol
                                          
    @Published var recipes: [LocalRecipe] = []
    @Published var selectedRecipes: [LocalRecipe] = []
    @Published var savedRecipes: [LocalRecipe] = []
    
    init(repository: RepositoryProtocol) {
        self.repository = repository

        DispatchQueue.main.async {
            Task {
                //TODO: change query to category
                guard let recipesFromApi = try? await repository.getRecipes(query: "pasta") else {
                    self.recipes = []
                    print("Unable to get recipes from api")
                    return
                }
                self.recipes = recipesFromApi
            }
        }
        readSelectedRecipesFromUserDefaults()
    }

//TODO: deselected if clicked on button and store in userdefautls to load them in savedRecipesView()
    func filterAndSaveSelectedRecipes(){
        selectedRecipes = recipes.filter { $0.isSelected }
        print("SelectedRecipes: ")
        selectedRecipes.forEach { recipe in
            print(recipe.remoteRecipe.label)
            addRecipeToSaved(recipe: recipe)
        }
        saveSelectedRecipesToUserDefaults(recipes: selectedRecipes)
    }
    
    func saveSelectedRecipesToUserDefaults(recipes: [LocalRecipe]){
        UserDefaultsHelper.defaults.saveSelectedRecipesIntoUserDefaults(recipes: recipes)
    }
    
    func readSelectedRecipesFromUserDefaults(){
        savedRecipes = UserDefaultsHelper.defaults.readSavedRecipesFromUserDefaults()
    }
    
//TODO: the saverecipes when restarting app is empty at beginning make sure it stays the same props first line
    func addRecipeToSaved(recipe: LocalRecipe) {
        savedRecipes.append(recipe)
    }
    
//TODO: add or remove from defaults savedarray
//    func removeRecipeFromSaved(recipe: LocalRecipe) {
//        if let index = savedRecipes.firstIndex(where: {$0.id == recipe.id}) {
//            savedRecipes.remove(at: index)
//            saveSelectedRecipesToUserDefaults()
//        }
//    }
}

