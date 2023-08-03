//
//  GroceriesView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI

struct GroceriesView: View {
    var groceryList = [
        Grocery(ingredient: "Linguine", amount: 200, unit: "g"),
        Grocery(ingredient: "Eggs", amount: 4, unit: ""),
        Grocery(ingredient: "Pancetta", amount: 200, unit: "g"),
        Grocery(ingredient: "Pesto", amount: 50, unit: "g"),
        Grocery(ingredient: "Fusili", amount: 250, unit: "g"),
        Grocery(ingredient: "Cheese", amount: 200, unit: "g")
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
    var grocery: Grocery
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

