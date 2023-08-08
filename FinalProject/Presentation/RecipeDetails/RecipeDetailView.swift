//
//  RecipeDetailView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 4/8/23.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: LocalRecipe

    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: "\(recipe.remoteRecipe.image)"),
                       content: { image in
               image.resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(height: 300)
                  .cornerRadius(15)
            }, placeholder: {
                ProgressView().frame(height: 300)
                    .cornerRadius(15)
            }).accessibilityAddTraits(.isImage).accessibilityLabel("Image of recipe")
            
            ScrollView {
                VStack(alignment: .leading){
                    Text("\(recipe.remoteRecipe.label)")
                        .font(.title2)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                    Text("Ingredients").font(.title3).padding(2)
                    ForEach(recipe.remoteRecipe.ingredients, id: \.foodId) { ingredient in
                        HStack{
                            Text("• \(ingredient.food)")
                            Spacer()
                            Text("\(String(format: "%.1f", ingredient.quantity))")
                            Text("\(ingredient.measure ?? " ")")
                        }.font(.body)
                    }
                    
                    //TODO: get pics
//                    HStack{
//                        ForEach(recipe.remoteRecipe.ingredients, id: \.foodId) { ingredient in
//                            AsyncImage(url: URL(string: "\(ingredient.image)"),
//                                       content: { image in
//                               image.resizable()
//                                  .aspectRatio(contentMode: .fill)
//                                  .frame(width: 25, height: 25).cornerRadius(15)
//                            }, placeholder: {
//                                ProgressView().frame(width: 25, height: 25)
//                            })
//                        }
//                    }
                }.padding(16)
                Spacer()
            }
        }
    }
}
