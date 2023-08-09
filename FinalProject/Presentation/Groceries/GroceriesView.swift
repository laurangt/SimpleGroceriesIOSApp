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
    // TODO: if empty display add recipe to get ingredients
    var body: some View {
        NavigationStack{
            if recipesViewModel.savedRecipes == [] {
                EmptySavedRecipesPlaceholderView()
            } else {
                List{
                    ForEach(recipesViewModel.savedRecipes){ recipe in
                        //                    RecipeViewSection(recipe: recipe)
                        GroceryCellView(recipe: recipe)
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




//// MARK: - Components
//struct RecipeViewSection: View {
//
//    var recipe: LocalRecipe
//    
//    var body: some View {
//        //TODO: change actual groceryState and save to db
//        //TODO: checkbox for single item not all at once whe clicked
//        Section {
////            ForEach(recipe.localIngredients){ ingredient in
////                GroceryCellView(ingredient: ingredient)
////            }
//        } header: {
//            Text("\(recipe.label)")
//        }
//    }
//}
//
//// MARK: - Components
//struct GroceryCellView: View {
//    @Binding var ingredient: LocalIngredient
//    @State private var isChecked = false
//
//    var body: some View {
//
//        //TODO: change actual groceryState and save to db
//        //TODO: checkbox for single item not all at once whe clicked
//        HStack{
//            CheckboxView(isChecked: $ingredient.isCompleted).foregroundColor(Color("mainOrange"))
//            Text("\(ingredient.remoteIngredient.food)")
//            Spacer()
//            HStack{
//                Text("\(String(format: "%.2f", ingredient.remoteIngredient.quantity))")
//                Text("\(ingredient.remoteIngredient.measure ?? " ")")
//            }
//        }
//        
//    }
//}


//
//// MARK: - Components
struct GroceryCellView: View {
    var recipe: LocalRecipe
    @State private var isChecked = false
    
    var body: some View {
        
        //TODO: change actual groceryState and save to db
        //TODO: checkbox for single item not all at once whe clicked
        Section {
            ForEach(recipe.localIngredients){ grocery in
                HStack{
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square").foregroundColor(Color("mainOrange")).onTapGesture {
                        isChecked.toggle()
                    }
                    Text("\(grocery.remoteIngredient.food)")
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
