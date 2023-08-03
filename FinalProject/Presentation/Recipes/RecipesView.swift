//
//  RecipesView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI

struct RecipesView: View {
    //TODO: Change to recipe api and create model
    var recipeList = [
        Grocery(ingredient: "Linguine", amount: 200, unit: "g"),
        Grocery(ingredient: "Eggs", amount: 4, unit: ""),
        Grocery(ingredient: "Pancetta", amount: 200, unit: "g"),
        Grocery(ingredient: "Linguine", amount: 200, unit: "g"),
        Grocery(ingredient: "Eggs", amount: 4, unit: ""),
        Grocery(ingredient: "Pancetta", amount: 200, unit: "g"),
        Grocery(ingredient: "Linguine", amount: 200, unit: "g"),
        Grocery(ingredient: "Eggs", amount: 4, unit: ""),
        Grocery(ingredient: "Pancetta", amount: 200, unit: "g")
    ]
        
    var body: some View {
        NavigationStack{
            VStack{
                VStack(spacing: 20) {
//                    ForEach(recipeList){ recipe in
//                        RecipeComponent()
//                    }
                    HStack(spacing: 20) {
                        RecipeComponent()
                        RecipeComponent()
                    }

                    HStack(spacing: 20) {
                        RecipeComponent()
                        RecipeComponent()
                    }
                }
                .padding()
            }.navigationTitle("Categorie.title")
                .navigationBarTitleDisplayMode(.inline)
           Spacer()
            Button("Add to groceries") {
                print("Add ingredients to my grocery list")
            }.frame(minHeight: 40).padding(EdgeInsets(top: 10, leading: 0, bottom: 40, trailing: 0)).buttonStyle(.borderedProminent)
                .tint(Color("mainOrange"))
        }
        
    }

}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}



struct RecipeComponent: View {
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
//                .gesture(TapGesture().onEnded {
//                    print(color.description)
//                })
            VStack{
                Image("carbonara").resizable().frame(width: 150, height: 120).cornerRadius(15).scaledToFit()
                HStack(alignment: .bottom){
                    Text("Recipe.name")
                    CheckboxView()
                }
            }
            
        }
        
//        VStack(spacing: 20) {
//            HStack(spacing: 20) {
//                box()
//                box()
//            }
//
//            HStack(spacing: 20) {
//                box()
//                box()
//            }
//        }
    }

//    func box() -> some View {
//
//    }
}
