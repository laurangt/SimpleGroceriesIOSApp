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
    
    // TODO: checkbox of each grocery not working rn all together
    // TODO: sometimes ingredients twice for one recipe then id problem what can i do - filter if already exist same name
    var body: some View {
        NavigationStack{
            if recipesViewModel.savedRecipes == [] {
                EmptySavedRecipesPlaceholderView()
            } else {
                List{
                    ForEach($recipesViewModel.savedRecipes){ $recipe in
                        //                    RecipeViewSection(recipe: recipe)
                        GroceryCellView(recipe: $recipe)
                    }
                    .listRowSeparatorTint(Color("mainOrange"))
                }.navigationTitle("My Groceries").navigationBarTitleDisplayMode(.inline)
                    .onAppear {
                        recipesViewModel.loadSavedRecipesFromUserDefaults()
                    }
                //                .scrollContentBackground(.hidden)
                //                .background(.white)
            }
        }
    }
}

struct GroceriesView_Previews: PreviewProvider {
    static var previews: some View {
        GroceriesView(recipesViewModel: RecipesViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
    }
}

//
//// MARK: - Components
struct GroceryCellView: View {
    @Binding var recipe: LocalRecipe
    @State private var isChecked = false
    
    var body: some View {
        
        //TODO: change actual groceryState and save to db save to db
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
