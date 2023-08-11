//
//  SavedRecipesView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI

struct SavedRecipesView: View {
    @ObservedObject var recipesViewModel: RecipesViewModel
    
    init(recipesViewModel: RecipesViewModel) {
        self.recipesViewModel = recipesViewModel
        recipesViewModel.readSavedRecipesFromUserDefaults()
    }
    
    var body: some View {
        NavigationStack{
            if recipesViewModel.savedRecipes.isEmpty {
                VStack{
                    EmptyViewPlaceholderComponent()
                }.navigationTitle("Saved Recipes").navigationBarTitleDisplayMode(.inline)
            } else {
                List{
                    ForEach(recipesViewModel.savedRecipes){ savedRecipe in
                        NavigationLink {
                            RecipeDetailView(recipe: savedRecipe)
                        } label: {
                            SavedRecipeCell(savedRecipe: savedRecipe)
                        }
                    }
                    .onDelete(perform: recipesViewModel.deleteSavedRecipe)
                    .listRowSeparatorTint(Color("mainOrange"))
                }
                .onAppear(perform: {
                    recipesViewModel.readSavedRecipesFromUserDefaults()
                })
                .navigationTitle("Saved Recipes").navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
}

struct SavedRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRecipesView(recipesViewModel: RecipesViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
    }
}


struct SavedRecipeCell: View{
    var savedRecipe: LocalRecipe
    
    var body: some View {
        HStack{
            AsyncImageComponent(url: savedRecipe.image, width: 100, height: 80, accessibilitydescription: "recipe")
            Text("\(savedRecipe.label)")
        }
    }
}
