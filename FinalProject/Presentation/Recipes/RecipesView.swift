//
//  RecipesView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI
//TODO: splash here as overlay so pics load in background and are loaded when eaching this page play w times
//TODO: make banner text white
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
            RoundedRectangle(cornerRadius: 15)
               .fill(Color("mainOrange"))
             .frame(
               width: UIScreen.main.bounds.width * 0.9,
               height: 50
             )
             .transition(.asymmetric(
               insertion: .move(edge: .top),
               removal: .move(edge: .top)
             ))
             .overlay { Text("\(recipesViewModel.selectedRecipes.count) recipes saved").foregroundColor(.white)}
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
                  }
               }
            }
            .padding()
            .overlay(alignment: .bottom) {
               Button("Save recipes") {
                  // TODO: add ingredients to groceries
                  print("Add ingredients to my grocery list")
                  recipesViewModel.filterSelectedRecipes()
                  recipesViewModel.loadSavedRecipesFromUserDefaults()
                  recipesViewModel.selectedRecipes.forEach { recipe in
                     recipesViewModel.addRecipeToSaved(recipe: recipe)
                     // TODO: deselect selctedrecipes after added
      //               recipe.isSelected.toggle()
                  }
                  recipesViewModel.saveSelectedRecipesToUserDefaults(recipes: recipesViewModel.savedRecipes)
                  withAnimation { recipeAddedBanner.toggle() }
                  
               }
               .frame(height: 40)
               .padding(EdgeInsets(top: 10, leading: 0, bottom: 40, trailing: 0)).buttonStyle(.borderedProminent)
               .tint(Color("mainOrange"))
               .accessibilityLabel("Submit button: Save selected Recipes")
               .accessibilityAddTraits(.isButton)
            }
            //TODO: if categoreis change title to category
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
            AsyncImage(url: recipe.image ?? URL(string: ""),
                       content: { image in
               image.resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 170, height: 110)
                  .cornerRadius(15)
            }, placeholder: {
               ProgressView().frame(width: 170, height: 110)
            }).accessibilityAddTraits(.isImage).accessibilityLabel("Image of recipe")
            
            HStack(alignment: .center){
               Text("\(recipe.label)").font(.subheadline).foregroundColor(.black).lineLimit(2).padding(3)
               CheckboxView(isChecked: $recipe.isSelected).foregroundColor(Color("mainOrange"))
            }
            Spacer()
         }
      }.frame(width: 170, height: 170).shadow(radius: 5).cornerRadius(10)
   }
}



