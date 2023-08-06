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
    }
    
    //TODO: ondelete: delete
    var body: some View {
        NavigationStack{
            List{
                ForEach(recipesViewModel.savedRecipes){ savedRecipe in
                    SavedRecipeCell(savedRecipe: savedRecipe)
                }.listRowSeparatorTint(Color("mainOrange"))
            }
            .onAppear(perform: {
                recipesViewModel.readSelectedRecipesFromUserDefaults()
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
            Image("carbonara").resizable().frame(width: 100, height: 80).cornerRadius(15).scaledToFit()
            VStack{
                Text("\(savedRecipe.remoteRecipe.label)")
            }
        }
    }
}
