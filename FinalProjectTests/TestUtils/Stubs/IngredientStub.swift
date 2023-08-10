//
//  IngredientStub.swift
//  FinalProjectTests
//
//  Created by Nguyen-Trong Laura on 9/8/23.
//

import Foundation
@testable import FinalProject

struct IngredientStub {
    func getStubRemoteIngredients() -> RemoteIngredient{
        return RemoteIngredient(food: "pasta", quantity: 200, image: URL(string: "https://www.edamam.com/food-img/296/296ff2b02ef3822928c3c923e22c7d19.jpg"), foodId: "")
    }
    
    func getStubLocalIngredient() -> LocalIngredient{
        return LocalIngredient(remoteIngredient: RemoteIngredient(food: "pasta", quantity: 200, image: URL(string: "https://www.edamam.com/food-img/296/296ff2b02ef3822928c3c923e22c7d19.jpg"), foodId: ""), isCompleted: false)
    }
}
