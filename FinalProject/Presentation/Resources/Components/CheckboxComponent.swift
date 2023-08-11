//
//  CheckboxView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI

struct CheckboxView: View {
    @Binding var isChecked: Bool

    var body: some View {
        Image(systemName: isChecked ? "checkmark.square.fill" : "square")
            .onTapGesture {
            isChecked.toggle()
            
        }
    }
}

