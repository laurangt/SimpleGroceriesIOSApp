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
        recipesViewModel.loadSavedRecipesFromUserDefaults()
    }
    
    var body: some View {
        NavigationStack{
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
                recipesViewModel.loadSavedRecipesFromUserDefaults()
            })
            .navigationTitle("My saved Recipes")
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
            AsyncImage(url: savedRecipe.image ?? URL(string: ""),
                       content: { image in
               image.resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 100, height: 80)
                  .cornerRadius(15)
            }, placeholder: {
               ProgressView().frame(width: 100, height: 80)
            }).accessibilityAddTraits(.isImage).accessibilityLabel("Image of recipe")
            Text("\(savedRecipe.label)")
        }
    }
}
