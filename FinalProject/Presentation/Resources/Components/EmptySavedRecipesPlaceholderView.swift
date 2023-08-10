//
//  EmptySavedRecipesPlaceholderView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 9/8/23.
//

import SwiftUI

struct EmptySavedRecipesPlaceholderView: View {
    var body: some View {
        NavigationStack{
            Text("Please save some recipes first")
            Image(systemName: "fork.knife.circle").animation(.easeInOut(duration: 2))
        }
    }
}

//struct EmptySavedRecipesPlaceholderView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmptySavedRecipesPlaceholderView()
//    }
//}