//
//  RecipesView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI
//TODO: splash here as overlay so pics load in background and are loaded when eaching this page play w times

struct RecipesView: View {

   @ObservedObject var recipesViewModel: RecipesViewModel
   @State private var recipeQuery = ""
   @State private var recipeAddedBanner = false
   @State private var navigationTitleCuisine = "Recipes"
   
   init(recipesViewModel: RecipesViewModel) {
      self.recipesViewModel = recipesViewModel
   }
   
   let columns = [
      GridItem(.flexible()),
      GridItem(.flexible())
   ]
   
   let rowsCuisine = [
      GridItem(.flexible()),
      GridItem(.flexible())
   ]
   
   
   var body: some View {
      NavigationStack{
         if recipeAddedBanner {
            BannerComponent()
               .overlay {
                recipesViewModel.selectedRecipes.count == 1 ? Text("\(recipesViewModel.selectedRecipes.count) recipe saved").foregroundColor(.white) : Text("\(recipesViewModel.selectedRecipes.count) recipes saved").foregroundColor(.white)
               }
               .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.recipeAddedBanner.toggle()
                }
            }
         }
         VStack{
            VStack {
               HStack{
                  VStack(alignment: .leading) {
                     Text("Recommended cuisines").font(.body)
                     ScrollView(.horizontal) {
                        LazyHGrid(rows: rowsCuisine) {
                           ForEach(recipesViewModel.cuisineTypes, id: \.self){ cuisineType in
                              ZStack{
                                 RoundedRectangle(cornerRadius: 15)
                                    .fill(Color("mainOrange"))
                                    .frame(width: 120, height: 40)
                                 Button {
                                    Task {
                                       await recipesViewModel.searchRecipes(query: cuisineType)
                                    }
                                    navigationTitleCuisine = cuisineType + " Recipes"
                                 } label: {
                                    Text("\(cuisineType)").foregroundColor(.white).font(.callout)
                                 }
                              }
                           }
                        }.frame(height: 100)
                     }
                  }
               }
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
                     recipeQuery = ""
                  }
               }
            }
            .padding()
            .overlay(alignment: .bottom) {
               Button("Save recipes") {
                  recipesViewModel.filterSelectedRecipes()
                  recipesViewModel.selectedRecipes.forEach { recipe in
                     recipesViewModel.addRecipeToSaved(recipe: recipe)
                  }
                  recipesViewModel.saveSelectedRecipesToUserDefaults(recipes: recipesViewModel.savedRecipes)
                  withAnimation { recipeAddedBanner.toggle() }
                  recipesViewModel.removeSelectedAfterAdded()
               }
               .frame(height: 40)
               .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0))
               .buttonStyle(.borderedProminent)
               .tint(Color("mainOrange"))
               .accessibilityLabel("Submit button: Save selected Recipes")
               .accessibilityAddTraits(.isButton)
            }
         }.navigationTitle("\(navigationTitleCuisine)")
            .navigationBarTitleDisplayMode(.inline)
      }
      .navigationBarBackButtonHidden(true)
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
            AsyncImageComponent(url: recipe.image, width: 170, height: 110, accessibilitydescription: "recipe")
            HStack(alignment: .center){
               Text("\(recipe.label)").font(.subheadline).foregroundColor(Color("assetBlack")).lineLimit(2).padding(3)
               CheckboxView(isChecked: $recipe.isSelected).foregroundColor(Color("mainOrange"))
            }
            Spacer()
         }
      }.frame(width: 170, height: 170).shadow(radius: 5).cornerRadius(10)
   }
}



