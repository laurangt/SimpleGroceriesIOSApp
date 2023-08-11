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
            await self.searchRecipes(query: "mediterranean")
        }
        readSavedRecipesFromUserDefaults()
    }

    //MARK: - Fetch method
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
    
    // MARK: - UserDefaults methods
    func saveSelectedRecipesToUserDefaults(recipes: [LocalRecipe]){
        UserDefaultsHelper.defaults.saveSelectedRecipesIntoUserDefaults(recipes: recipes)
    }
    
    func readSavedRecipesFromUserDefaults(){
        savedRecipes = UserDefaultsHelper.defaults.readSavedRecipesFromUserDefaults()
    }
    
    //MARK: - CRUD methods
    func filterSelectedRecipes(){
        selectedRecipes = recipes.filter { $0.isSelected }
    }
    
    func addRecipeToSaved(recipe: LocalRecipe) {
        savedRecipes.append(recipe)
    }
    
    func removeSelectedAfterAdded(){
        recipes.indices.forEach { index in
            recipes[index].isSelected = false
        }
    }

    func deleteSavedRecipe(at offsets: IndexSet){
        savedRecipes.remove(atOffsets: offsets)
        saveSelectedRecipesToUserDefaults(recipes: savedRecipes)
    }

}



