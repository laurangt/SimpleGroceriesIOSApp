//
//  ContentView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI

struct RootView: View {
    let recipeViewModel = RecipesViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl()))
    
    @State var isActive: Bool = false

    var body: some View {
        VStack{
            if self.isActive {
                TabView{
                    RecipesView(recipesViewModel: recipeViewModel).tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search Recipe")
                    }
                    
                    GroceriesView(recipesViewModel: recipeViewModel).tabItem {
                        Image(systemName: "list.clipboard")
                        Text("My Groceries")
                    }
                    
                    SavedRecipesView(recipesViewModel: recipeViewModel).tabItem {
                        Image(systemName: "bookmark.fill")
                        Text("Saved recipes")
                    }
                }.accentColor(Color("mainOrange"))
            } else {
                SplashView()
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.isActive = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
