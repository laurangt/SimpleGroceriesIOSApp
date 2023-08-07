//
//  ContentView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI

struct ContentView: View {
    let viewmodel = RecipesViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl()))
    
    var body: some View {
       
        TabView{
//            GroceriesView(recipesViewModel: RecipesViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl()))).tabItem {
//                Image(systemName: "list.clipboard")
//                Text("My Groceries")
//            }
            
            RecipesView(recipesViewModel: viewmodel).tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search Recipe")
            }
            
            SavedRecipesView(recipesViewModel: viewmodel).tabItem {
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
