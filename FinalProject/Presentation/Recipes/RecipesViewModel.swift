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

            Task {
                //TODO: change query to category if using popup or do popup as defualt instead of pasta
                await self.searchRecipes(query: "pasta")
            }
        
        loadSavedRecipesFromUserDefaults()
        
        savedRecipes.forEach { re in
            print("init")
            print(re.remoteRecipe.label)
        }
    }

    func searchRecipes(query: String) async {
        guard let recipesFromApi = try? await repository.getRecipes(query: query) else {
            self.recipes = []
            print("Unable to get recipes from api")
            return
        }
        
        //TODO: fix purple error
        DispatchQueue.main.async {
            self.recipes = recipesFromApi
        }
        //TODO: needed?
        loadSavedRecipesFromUserDefaults()
        print("search")
        savedRecipes.forEach { re in
            print(re.remoteRecipe.label)
        }
    }
    
//TODO: deselected if clicked on button and store in userdefautls to load them in savedRecipesView()
    func filterAndSaveSelectedRecipes(){
        selectedRecipes = recipes.filter { $0.isSelected }
       
        selectedRecipes.forEach { recipe in
            print(recipe.remoteRecipe.label)
            addRecipeToSaved(recipe: recipe)
        }
        saveSelectedRecipesToUserDefaults(recipes: savedRecipes)
        loadSavedRecipesFromUserDefaults()

    }
    
    func saveSelectedRecipesToUserDefaults(recipes: [LocalRecipe]){
        UserDefaultsHelper.defaults.saveSelectedRecipesIntoUserDefaults(recipes: recipes)
    }
    
    func loadSavedRecipesFromUserDefaults(){
        DispatchQueue.main.async {
            self.savedRecipes = UserDefaultsHelper.defaults.readSavedRecipesFromUserDefaults()
            print("loaodfromuser")
            self.savedRecipes.forEach { re in
                print(re.remoteRecipe.label)
            }
        }
    }
    
//TODO: the saverecipes when restarting app is empty at beginning make sure it stays the same props first line
    func addRecipeToSaved(recipe: LocalRecipe) {
        savedRecipes.append(recipe)
        loadSavedRecipesFromUserDefaults()
    }
    
//TODO: add or remove from defaults savedarray
//    func removeRecipeFromSaved(recipe: LocalRecipe) {
//        if let index = savedRecipes.firstIndex(where: {$0.id == recipe.id}) {
//            savedRecipes.remove(at: index)
//            saveSelectedRecipesToUserDefaults()
//        }
//    }
}



