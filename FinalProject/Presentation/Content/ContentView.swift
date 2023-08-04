//
//  ContentView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        TabView{
            GroceriesView().tabItem {
                Image(systemName: "list.clipboard")
                Text("My Groceries")
            }
            
            RecipesView(recipesViewModel: RecipesViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl()))).tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search Recipe")
            }
            
            SavedRecipesView().tabItem {
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
