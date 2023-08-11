//
//  GroceriesView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI

struct GroceriesView: View {
    @ObservedObject var recipesViewModel: RecipesViewModel
    
    init(recipesViewModel: RecipesViewModel) {
        self.recipesViewModel = recipesViewModel
    }
    
    var body: some View {
        NavigationStack{
            if recipesViewModel.savedRecipes == [] {
                VStack{
                    EmptyViewPlaceholderComponent()
                }.navigationTitle("My Groceries").navigationBarTitleDisplayMode(.inline)
            } else {
                List{
                    ForEach($recipesViewModel.savedRecipes){ $recipe in
                        GroceryCellView(recipe: $recipe)
                    }
                    .listRowSeparatorTint(Color("mainOrange"))
                }.navigationTitle("My Groceries").navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    recipesViewModel.readSavedRecipesFromUserDefaults()
                }
                .onDisappear{
                    recipesViewModel.saveSelectedRecipesToUserDefaults(recipes: recipesViewModel.savedRecipes)
                }
            }
        }
    }
}

//MARK: COMPONENTS
struct GroceryCellView: View {
    @Binding var recipe: LocalRecipe
    @State private var isChecked = false
    
    var body: some View {
        Section {
            ForEach($recipe.localIngredients){ $grocery in
                HStack{
                    CheckboxView(isChecked: $grocery.isCompleted).foregroundColor(Color("mainOrange"))
                    Text("\(grocery.remoteIngredient.food.capitalized)")
                    Spacer()
                    HStack{
                        if String(format: "%.2f", grocery.remoteIngredient.quantity).hasSuffix(".00") {
                            Text("\(String(format: "%.0f", grocery.remoteIngredient.quantity))")
                        } else {
                            Text("\(String(format: "%.2f", grocery.remoteIngredient.quantity))")
                        }
                        
                        if grocery.remoteIngredient.measure == "<unit>" {
                            Text("unit")
                        } else if grocery.remoteIngredient.measure == "teaspoon" {
                            Text("tsp")
                        } else if grocery.remoteIngredient.measure == "tablespoon" {
                            Text("tbsp")
                        } else if grocery.remoteIngredient.measure == "pound" {
                            Text("lb")
                        } else {
                            Text("\(grocery.remoteIngredient.measure ?? "")")
                        }
                    }
                }
            }
        } header: {
            Text("\(recipe.label)")
        }
    }
}
