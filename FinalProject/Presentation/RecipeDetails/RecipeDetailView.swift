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
       GridItem(.flexible(), spacing: 5),
       GridItem(.flexible(), spacing: 5),
       GridItem(.flexible(), spacing: 5)
    ]
    
    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(url: recipe.image ?? URL(string: ""),
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
                    Text("\(recipe.label)".capitalized).font(.title2)
                    Text("\(recipe.cuisineType[0])".capitalized).font(.footnote).padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                    Divider().fontWeight(.regular).foregroundColor(Color("mainOrange"))
                    Text("Ingredients").font(.title3).padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
//                    ForEach(recipe.localIngredients, id: \.id) { ingredient in
//                        HStack{
//                            Text("• \(ingredient.remoteIngredient.food)")
//                            Spacer()
//                            Text("\(String(format: "%.1f", ingredient.remoteIngredient.quantity))")
//                            Text("\(ingredient.remoteIngredient.measure ?? " ")")
//                        }.font(.body)
//                    }
                    
                    //TODO: get pics
                    LazyVGrid(columns: columns) {
                        ForEach(recipe.localIngredients, id: \.id) { ingredient in
                            VStack{
                                AsyncImage(url: ingredient.remoteIngredient.image ?? URL(string: ""),
                                           content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 60, height: 60).cornerRadius(15)
                                }, placeholder: {
                                    ProgressView().frame(width: 50, height: 50)
                                }).accessibilityLabel("\(ingredient.remoteIngredient.food)").accessibilityAddTraits(.isImage)
                                Text("\(ingredient.remoteIngredient.food)".capitalized).lineLimit(2)
//                                HStack{
//                                    Text("\(ingredient.remoteIngredient.food)")
//                                    Spacer()
//                                    Text("\(String(format: "%.1f", ingredient.remoteIngredient.quantity))")
//                                    Text("\(ingredient.remoteIngredient.measure ?? " ")")
//                                }.font(.footnote)
                            }.frame(width: 100, height: 100)
                        }
                    }
                }.padding(16)
               
            }
            Spacer()
        }
       
    }
}
