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
    
    // TODO: get actual grocerylist
    var body: some View {
        NavigationStack{
            List{
                ForEach(recipesViewModel.savedRecipes){ recipe in
                    GroceryCellView(recipe: recipe)
                }
                .listRowSeparatorTint(Color("mainOrange"))
            }.navigationTitle("Groceries")
                .onAppear {
                    recipesViewModel.loadSavedRecipesFromUserDefaults()
                }
        }
    }
}

struct GroceriesView_Previews: PreviewProvider {
    static var previews: some View {
        GroceriesView(recipesViewModel: RecipesViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
    }
}




// MARK: - Components
struct GroceryCellView: View {
    var recipe: LocalRecipe
    @State private var isChecked = false

    var body: some View {

        //TODO: change actual groceryState and save to db
        //TODO: checkbox for single item not all at once whe clicked
        Section {
            ForEach(recipe.remoteRecipe.ingredients){ grocery in
                HStack{
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square").foregroundColor(Color("mainOrange")).onTapGesture {
                        isChecked.toggle()
                    }
                    Text("\(grocery.food)")
                    Spacer()
                    HStack{
                        Text("\(String(format: "%.2f", grocery.quantity))")
                        Text("\(grocery.measure ?? " ")")
                    }
                }
            }
        } header: {
            Text("\(recipe.remoteRecipe.label)")
        }
    }
}


