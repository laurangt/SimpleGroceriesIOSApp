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
        VStack{
            AsyncImage(url: URL(string: "\(recipe.remoteRecipe.image)"),
                       content: { image in
               image.resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(height: 300)
                  .cornerRadius(15)
            },
                       placeholder: {
                ProgressView().frame(height: 300)
                    .cornerRadius(15)
            }).accessibilityAddTraits(.isImage).accessibilityLabel("Image of recipe")
            
            ScrollView {
                VStack(alignment: .leading){
                    Text("\(recipe.remoteRecipe.label)").font(.title2).fixedSize(horizontal: false, vertical: true).padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                    Text("Ingredients").font(.title3).padding(4)
                    ForEach(recipe.remoteRecipe.ingredients, id: \.foodId) { ingredient in
                        Text("• \(ingredient.food)").fixedSize(horizontal: false, vertical: true)
                    }
                    
                    //TODO: get pics
    //                HStack{
    //                    ForEach(recipe.remoteRecipe.ingredients, id: \.text) { ingredient in
    //                        AsyncImage(url: URL(string: "\(ingredient.image)"),
    //                                   content: { image in
    //                           image.resizable()
    //                              .aspectRatio(contentMode: .fill)
    //                              .frame(width: 25, height: 25).cornerRadius(15).scaledToFit()
    //                        },
    //                                   placeholder: {
    //                            Image("foodPlaceholder").frame(width: 25, height: 25)
    //                        })
    //                    }
    //                }
                }.padding(16)
                Spacer()
            }
        }
    }
}
