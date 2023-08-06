//
//  UserDefaultsHelper.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 6/8/23.
//

import Foundation

final class UserDefaultsHelper {
    
    static let defaults = UserDefaultsHelper()
    private init() {}
    
    func saveSelectedRecipesIntoUserDefaults(recipes: [LocalRecipe]){
        if let encodedData = try? JSONEncoder().encode(recipes){
            UserDefaults.standard.set(encodedData, forKey: "selectedRecipes")
        }
    }
    
    func readSavedRecipesFromUserDefaults() -> [LocalRecipe]{
        guard let data = UserDefaults.standard.data(forKey: "selectedRecipes"), let savedSelectedRecipes = try? JSONDecoder().decode([LocalRecipe].self, from: data) else {
            print("data empty")
            return []
        }
        return savedSelectedRecipes
    }
}

