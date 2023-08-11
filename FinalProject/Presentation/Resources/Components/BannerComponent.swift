//
//  BannerComponent.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 11/8/23.
//

import SwiftUI

struct BannerComponent: View {
    var body: some View {
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
    }
}


