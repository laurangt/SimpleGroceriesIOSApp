//
//  GroceriesViewModel.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 3/8/23.
//

import Foundation

final class GroceriesViewModel: ObservableObject{
    let repository: RepositoryProtocol

    init(repository: RepositoryProtocol) {
        self.repository = repository
    }

//    func mapperIngredientToGrocery(ingredients: [Ingredient]) -> [GroceryModel] {
//        repository.mapperIngredientToGrocery(ingredients: ingredients)
//    }

}

//keychain to store bool
