//
//  RecipeDetailView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 4/8/23.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: LocalRecipe
    
    
    //TODO: only if pics and groceries
//    @State private var isHovered = false
//    
    let columns = [
       GridItem(.flexible()),
       GridItem(.flexible()),
       GridItem(.flexible()),
       GridItem(.flexible()),
       GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: "\(recipe.image)"),
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
                    Text("\(recipe.label)")
                        .font(.title2)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                    Text("Ingredients").font(.title3).padding(2)
//                    ForEach(recipe.remoteRecipe.ingredients, id: \.foodId) { ingredient in
//                        HStack{
//                            Text("• \(ingredient.food)")
//                            Spacer()
//                            Text("\(String(format: "%.1f", ingredient.quantity))")
//                            Text("\(ingredient.measure ?? " ")")
//                        }.font(.body)
//                    }
                    
                    //TODO: get pics
                    LazyVGrid(columns: columns) {
                        ForEach(recipe.localIngredients, id: \.id) { ingredient in
                            VStack{
                                AsyncImage(url: URL(string: "\(ingredient.remoteIngredient.image)"),
                                           content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50).cornerRadius(15)
                                }, placeholder: {
                                    ProgressView().frame(width: 50, height: 50)
                                })
                                HStack{
                                    Text("\(ingredient.remoteIngredient.food)")
                                    Spacer()
                                    Text("\(String(format: "%.1f", ingredient.remoteIngredient.quantity))")
                                    Text("\(ingredient.remoteIngredient.measure ?? " ")")
                                }.font(.footnote)
                            }.frame(width: 50, height: 50)
                        }
                    }
                }.padding(16)
                Spacer()
            }
        }
    }
}
