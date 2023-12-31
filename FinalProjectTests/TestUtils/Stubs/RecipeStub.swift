//
//  RecipeStub.swift
//  FinalProjectTests
//
//  Created by Nguyen-Trong Laura on 7/8/23.
//

import Foundation
@testable import FinalProject

struct RecipeStub {
    
    let remoteRecipeString = "https://edamam-product-images.s3.amazonaws.com/web-img/210/2106c43a5c9be95afb2a432cc5c42a54.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQDfd2AyKEZIkMlKe90YSUpFOC5nJhBvgNJ7Kt8m%2BffHwAIhAPDYCRavX3lDq1%2BIUjrVC7wjc4Iq5ZzcEkLhDiyXk8OpKrkFCEIQABoMMTg3MDE3MTUwOTg2IgwRFMGsAGzUteEdZkwqlgUr478Fp8X%2B90jtcCp1ScGInceuA7PmW1oMTuEyXF5OekHJ6QG53RfTnVDiHF1AyCEUjL2Ak6mgj2KD2X3m0BOienloKU1nK2bSlQAnqCtJhdCAnxLJ2YXJ9SXDvbYDCuCS4iQfr59RJsKa96pwwRwbnLnUdS4igf%2FDKnw3Qd8mygCAiL18YJ0sZ0FzvMLGBy0hAfYDHzPkTIv39LsqjwCDUVMtsO8PGOqnj6d9uKX1h46Y9li0Av7bB07gyHckGIu426HpcyWlxAOL3UvSj17AiiBGGRXgFH2ftZfNBjwpx9%2FgaXPoJKd4OsEzasVdGe9bsjgkI8qcNemAjn3tl9QGFRwn9COJvcvPIwfLD7VqPMXOaddd8%2Bs4DrpeUHF359z6mjrFu9MFFn7fgnWZiVHz%2Fp0hRLHthCGBg9mwD8jIi9hCvWbBV6qma5uK5u20KvpUBhKbSstCsqYdV%2BfZEdA4XcsbEw1b1yi0b5Ghes1UZDKMncnGcprg%2F5pVX4EwsGUxfMwH4Vuvsci%2FnDF7P1IewRWkUicg32E8UX4gr6p7%2FFnSbqAH%2ByFx1iBOZegJdYYt4mxwCkYIdvZ679qDeAzVUNGbbq%2B09oNbBm%2Bi3n2cjP7U22otdtEkmIcgyijE3R%2Fm5Cv%2BF3FIZfQxiSQWQTmnmoTkkLsjSmkixP3Zb2P4G5WiHHr6zBcgS236XGBMCUlPbJYasJnoy3nZvC%2BwTDxM6rcQKg4comTRxTZhY54wwvAnQtRHXdmsyHmzPiNbhSDpYR4QeYO0Rx2vxhDlbMhUcMfsenHLSlrn74lneKb6SLDaMp9sonKZg%2FpV1294d7GamArXrRcqsBpCaa4N%2BrYGgBcovGageI89Gsi9JZ0emjFuKfQVvzDUnLimBjqwAftQP8egHpVQ9d7jC6caEh4ZNq9zH7lGrt7eWCb8eGqAj%2BN%2BBmj9lRTRAQuDwxniGPeQMJgfgmTyVyBmd9Nybuwf80PadyRAFsMxkx0XzERmajKq9UK6%2F1BJyq2s7BMcPPdkxA6DuG2t%2Fjz3Dkm9ZjJCgI2x%2F1sm%2BRMSc84QoAQnlZSQL%2FIpK2JaL5nImRIS4ezABvM9S2oLwVM1UkVhvnPYa7rcYaAH50SvPtoI3qSJ&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230805T093428Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFHCGBKFVA%2F20230805%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=62def16cfa8abebba806ce99e3a9332209928e56d4c7aeb6ace5e4cef5368d7d"

    let remoteIngredientString = "https://www.edamam.com/food-img/296/296ff2b02ef3822928c3c923e22c7d19.jpg"

    
    func getStubSelectedNNotRecipes() -> [LocalRecipe]{
        return [getStubRecipeLocalRecipe(isSelected: true), getStubRecipeLocalRecipe(isSelected: true), getStubRecipeLocalRecipe(isSelected: false)]
    }
    
    func expectedStubSelected() -> [LocalRecipe]{
        return [getStubRecipeLocalRecipe(isSelected: true), getStubRecipeLocalRecipe(isSelected: true)]
    }
    
    func getStubRecipeLocalRecipe(isSelected: Bool = false) -> LocalRecipe {
        return LocalRecipe(isSelected: isSelected, label: "pasta", localIngredients: [LocalIngredient(remoteIngredient: RemoteIngredient(food: "pasta", quantity: 5.4, image: URL(string: remoteIngredientString)!, foodId: ""), isCompleted: false)], cuisineType: ["italian"])
    }
    
    func getStubRemoteRecipe() -> RemoteRecipe {
        return RemoteRecipe(label: "pasta", image: URL(string: remoteRecipeString)!, ingredients: [RemoteIngredient(food: "pasta", quantity: 2.3, image: URL(string: remoteIngredientString), foodId: "")], cuisineType: [""])
    }
    
    func getStubRecipeRecipeModel() -> RecipeModel {
        return RecipeModel(recipe: RemoteRecipe(label: "pasta", image: URL(string: remoteRecipeString)!, ingredients: [RemoteIngredient(food: "pasta", quantity: 2.4, image: URL(string: remoteIngredientString), foodId: "")], cuisineType: ["italian"]))
    }
}
