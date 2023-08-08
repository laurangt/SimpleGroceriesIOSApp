//
//  ContentView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI

struct ContentView: View {
    let recipeViewModel = RecipesViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl()))
    
    var body: some View {
       
        TabView{
            GroceriesView(recipesViewModel: recipeViewModel).tabItem {
                Image(systemName: "list.clipboard")
                Text("My Groceries")
            }
            
            RecipesView(recipesViewModel: recipeViewModel).tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search Recipe")
            }
            
            SavedRecipesView(recipesViewModel: recipeViewModel).tabItem {
                Image(systemName: "bookmark.fill")
                Text("Saved recipes")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
