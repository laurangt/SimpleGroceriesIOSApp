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
    }

//TODO: deselected if clicked on button and store in userdefautls to load them in savedRecipesView()
    func saveSelectedRecipes(){
        savedRecipes = recipes.filter { $0.isSelected }
        print("SelectedRecipes: ")
        savedRecipes.forEach { rec in
            print(rec.remoteRecipe.label)
        }
    }
    
    
}
