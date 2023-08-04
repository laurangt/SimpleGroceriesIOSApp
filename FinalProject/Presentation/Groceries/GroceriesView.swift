//
//  GroceriesView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI

struct GroceriesView: View {
    // TODO: get actual grocerylist
    var groceryList = [
        GroceryModel(ingredient: "Linguine", amount: 200, unit: "g"),
        GroceryModel(ingredient: "Eggs", amount: 4, unit: ""),
        GroceryModel(ingredient: "Pancetta", amount: 200, unit: "g"),
        GroceryModel(ingredient: "Pesto", amount: 50, unit: "g"),
        GroceryModel(ingredient: "Fusili", amount: 250, unit: "g"),
        GroceryModel(ingredient: "Cheese", amount: 200, unit: "g")
    ]

    var body: some View {
        NavigationStack{
            List{
                ForEach(groceryList){ grocery in
                    GroceryCellView(grocery: grocery)
                }.listRowSeparatorTint(Color("mainOrange"))
            }.navigationTitle("Groceries")
        }
    }
}

struct GroceriesView_Previews: PreviewProvider {
    static var previews: some View {
        GroceriesView()
    }
}

// MARK: - Components
struct GroceryCellView: View {
    var grocery: GroceryModel
    @State private var isChecked = false
    
    var body: some View {
        HStack{
            //TODO: change actual groceryState
            Image(systemName: isChecked ? "checkmark.square.fill" : "square").foregroundColor(Color("mainOrange")).onTapGesture {
                isChecked.toggle()
            }
            Text("\(grocery.ingredient)")
            Spacer()
            HStack{
                Text("\(grocery.amount)")
                Text("\(grocery.unit)")
            }
        }
    }
}
