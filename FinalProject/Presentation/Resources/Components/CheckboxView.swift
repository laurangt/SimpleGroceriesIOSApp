//
//  CheckboxView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI

struct CheckboxView: View {
    @State private var isChecked = false

    var body: some View {
        Image(systemName: isChecked ? "checkmark.square.fill" : "square").onTapGesture {
            isChecked.toggle()
        }
    }
}

struct CheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxView()
    }
}
