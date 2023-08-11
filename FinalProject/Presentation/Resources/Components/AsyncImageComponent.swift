//
//  AsyncImageLoad.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 11/8/23.
//

import SwiftUI

struct AsyncImageComponent: View {
    let url: URL?
    let width: CGFloat?
    let height: CGFloat
    let accessibilitydescription: String
    
    var body: some View {
        AsyncImage(url: url ?? URL(string: ""),
                   content: { image in
           image.resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: width, height: height)
              .cornerRadius(15)
        }, placeholder: {
           ProgressView().frame(width: width, height: height)
        }).accessibilityAddTraits(.isImage).accessibilityLabel("Image of \(accessibilitydescription)")
    }
}

