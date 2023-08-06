//
//  RecipesView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI

struct RecipesView: View {
   //TODO: Change to recipe api and create model
   @ObservedObject var recipesViewModel: RecipesViewModel
//   @State var savedRecipes: [LocalRecipe] = []
   
   init(recipesViewModel: RecipesViewModel) {
      self.recipesViewModel = recipesViewModel
   }
   
   let columns = [
      GridItem(.flexible()),
      GridItem(.flexible())
   ]
   
   
   var body: some View {
      NavigationStack{
         VStack{
            VStack {
               ScrollView {
                  LazyVGrid(columns: columns) {
                     ForEach(recipesViewModel.recipes.indices, id: \.self){ index in
//                        NavigationLink {
//                           RecipeDetailView(recipe: recipe)
//                        } label: {
                        RecipeComponent(recipe: $recipesViewModel.recipes[index])
                     }
                  }
               }
            }
            .padding()
         }.navigationTitle("Categorie.title")
            .navigationBarTitleDisplayMode(.inline)
         Spacer()
         Button("Add to groceries") {
            // TODO: add ingredients to groceries
            recipesViewModel.filterAndSaveSelectedRecipes()
            print("Add ingredients to my grocery list")
         }.frame(minHeight: 40).padding(EdgeInsets(top: 10, leading: 0, bottom: 40, trailing: 0)).buttonStyle(.borderedProminent)
            .tint(Color("mainOrange"))
      }
      
   }
   
}

struct RecipesView_Previews: PreviewProvider {
   static var previews: some View {
      RecipesView(recipesViewModel: RecipesViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
   }
}



struct RecipeComponent: View {

   @Binding var recipe: LocalRecipe
   
   var body: some View {
      ZStack {
         VStack{
            AsyncImage(url: URL(string: "\(recipe.remoteRecipe.image)"),
                       content: { image in
               image.resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 170, height: 110).cornerRadius(15).scaledToFit()
            },
                       placeholder: {
               Image("foodPlaceholder")
            })
            
            HStack(alignment: .center){
               Text("\(recipe.remoteRecipe.label)").foregroundColor(.black).lineLimit(2).padding(3)
               CheckboxView(isChecked: $recipe.isSelected)
            }
            Spacer()
         }
      }.frame(width: 160, height: 170).shadow(radius: 5).cornerRadius(10)
   }
}


