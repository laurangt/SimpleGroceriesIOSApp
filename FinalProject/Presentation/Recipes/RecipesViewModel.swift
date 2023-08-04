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
    
//    func addRecipeToSaved(selectedRecipes: [LocalRecipe]){
//
//    }
}
