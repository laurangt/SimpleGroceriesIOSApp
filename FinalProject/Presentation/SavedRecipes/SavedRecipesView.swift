//
//  SavedRecipesView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI

struct SavedRecipesView: View {
    
    //TODO: Change for recipes saved
    var groceryList = [
        Grocery(ingredient: "Linguine", amount: 200, unit: "g"),
        Grocery(ingredient: "Eggs", amount: 4, unit: ""),
        Grocery(ingredient: "Pancetta", amount: 200, unit: "g")
    ]
    
    //TODO: ondelete: delete
    var body: some View {
        NavigationStack{
            List{
                ForEach(groceryList){ savedRecipe in
                    SavedRecipeCell()
                }.listRowSeparatorTint(Color("mainOrange"))
            }.navigationTitle("My saved Recipes")
        }
    }
}

struct SavedRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRecipesView()
    }
}


struct SavedRecipeCell: View{
//    var savedRecipe: SavedRecipe
    
    var body: some View {
        HStack{
            Image("carbonara").resizable().frame(width: 100, height: 80).cornerRadius(15).scaledToFit()
            VStack{
                Text("SavedRecipe.name")
                Text("SavedRecipe.servings")
                Text("SavedRecipe.cookingtime")
            }
        }
    }
}
