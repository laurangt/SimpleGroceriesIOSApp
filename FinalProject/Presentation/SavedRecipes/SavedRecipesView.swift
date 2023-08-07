//
//  SavedRecipesView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI

struct SavedRecipesView: View {
    @ObservedObject var recipesViewModel: RecipesViewModel

//TODO: click on recipe in saved to get details view
    //TODO: load picture and make load not default pic spinner
    init(recipesViewModel: RecipesViewModel) {
        self.recipesViewModel = recipesViewModel
        recipesViewModel.loadSavedRecipesFromUserDefaults()
    }
    
    //TODO: ondelete: delete
    var body: some View {
        NavigationStack{
            List{
                ForEach(recipesViewModel.savedRecipes){ savedRecipe in
                    SavedRecipeCell(savedRecipe: savedRecipe)
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
            //TODO: image default or see whats up
            AsyncImage(url: URL(string: "\(savedRecipe.remoteRecipe.image)"),
                       content: { image in
               image.resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 100, height: 80).cornerRadius(15).scaledToFit()
            }, placeholder: {
               Image("foodPlaceholder")
            })
            Text("\(savedRecipe.remoteRecipe.label)")
        }
    }
}
