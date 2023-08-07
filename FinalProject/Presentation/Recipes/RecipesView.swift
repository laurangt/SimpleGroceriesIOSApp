//
//  RecipesView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI

struct RecipesView: View {
   @ObservedObject var recipesViewModel: RecipesViewModel
   @State private var recipeQuery = ""
   
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
                        NavigationLink {
                           RecipeDetailView(recipe: recipesViewModel.recipes[index])
                        } label: {
                           RecipeComponent(recipe: $recipesViewModel.recipes[index])
                        }
                     }
                  }
               }
               .searchable(text: $recipeQuery, prompt: "Search recipe").accessibilityLabel("search recipe").accessibilityAddTraits(.isSearchField)
               .onSubmit(of: .search) {
                  Task {
                     if !recipeQuery.isEmpty {
                        await recipesViewModel.searchRecipes(query: recipeQuery.lowercased())
                     }
                  }
                  
               }
            }
            .padding()
            //TODO: if categoreis change title to category
         }.navigationTitle("Recipes")
            .navigationBarTitleDisplayMode(.inline)
         Spacer()
         Button("Save recipes") {
            // TODO: add ingredients to groceries
            print("Add ingredients to my grocery list")
            recipesViewModel.filterAndSaveSelectedRecipes()
            // TODO: deselect selctedrecipes after added
         }
         .frame(minHeight: 40)
         .padding(EdgeInsets(top: 10, leading: 0, bottom: 40, trailing: 0)).buttonStyle(.borderedProminent)
         .tint(Color("mainOrange"))
         .accessibilityLabel("Submit button: Save selected Recipes")
         .accessibilityAddTraits(.isButton)
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
               ProgressView().frame(width: 170, height: 110)
            }).accessibilityAddTraits(.isImage).accessibilityLabel("Image of recipe")
            
            HStack(alignment: .center){
               Text("\(recipe.remoteRecipe.label)").foregroundColor(.black).lineLimit(2).padding(3)
               CheckboxView(isChecked: $recipe.isSelected).foregroundColor(Color("mainOrange"))
            }
            Spacer()
         }
      }.frame(width: 160, height: 170).shadow(radius: 5).cornerRadius(10)
   }
}


