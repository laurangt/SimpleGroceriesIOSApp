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
    var cuisineTypes = ["American", "Asian", "Baking", "Caribbean", "Italian", "Indian", "Mediterranean", "Mexican"]
    
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        Task {
            //TODO: change query to category if using popup or do popup as defualt instead of pasta
            await self.searchRecipes(query: "mediterranean")
        }
        loadSavedRecipesFromUserDefaults()
    }

    func searchRecipes(query: String) async {
        guard let recipesFromApi = try? await repository.getRecipes(query: query) else {
            self.recipes = []
            print("Unable to get recipes from api")
            return
        }
        
        DispatchQueue.main.async {
            self.recipes = recipesFromApi
        }
    }
    
//TODO: deselected if clicked on button
    func filterSelectedRecipes(){
        selectedRecipes = recipes.filter { $0.isSelected }
    }
    
    func saveSelectedRecipesToUserDefaults(recipes: [LocalRecipe]){
        UserDefaultsHelper.defaults.saveSelectedRecipesIntoUserDefaults(recipes: recipes)
    }
    
    func loadSavedRecipesFromUserDefaults(){
        DispatchQueue.main.async {
            self.savedRecipes = UserDefaultsHelper.defaults.readSavedRecipesFromUserDefaults()
        }
    }
    
    func addRecipeToSaved(recipe: LocalRecipe) {
        savedRecipes.append(recipe)
    }
    
//    func removeSelectedAfterAdded(){
//        selectedRecipes.forEach { recipe in
//            recipe.isSelected = false
//        }
//    }

    
    func deleteSavedRecipe(at offsets: IndexSet){
        savedRecipes.remove(atOffsets: offsets)
        saveSelectedRecipesToUserDefaults(recipes: savedRecipes)
    }


}



