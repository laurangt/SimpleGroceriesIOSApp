//
//  CircleLayoutPopupView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 3/8/23.
//

import SwiftUI

struct CircleLayoutPopupView: View {
    @ObservedObject var recipesViewModel: RecipesViewModel
   
    var body: some View {
        NavigationView {
            WheelLayout(radius: 130.0, rotation: .zero) {
                ForEach(recipesViewModel.cuisineTypes, id: \.self) { cuisineType in
                    NavigationLink {
                       RecipesView(recipesViewModel: recipesViewModel)
                    } label: {
                        Circle()
                            .fill(Color("mainOrange"))
                            .opacity(0.3)
                            .frame(width: 130, height: 130)
                            .overlay { Text("\(cuisineType)")
                            }
                    }
                    
                }
            }
        }
        
    }
    
}

struct CircleLayoutPopupView_Previews: PreviewProvider {
    static var previews: some View {
        CircleLayoutPopupView(recipesViewModel: RecipesViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
    }
}


struct WheelLayout: Layout {
    var radius: CGFloat
    var rotation: Angle
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        
        let maxSize = subviews.map { $0.sizeThatFits(proposal) }.reduce(CGSize.zero) {
            
            return CGSize(width: max($0.width, $1.width), height: max($0.height, $1.height))
            
        }
        
        return CGSize(width: (maxSize.width / 2 + radius) * 2,
                      height: (maxSize.height / 2 + radius) * 2)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ())
    {
        let angleStep = (Angle.degrees(360).radians / Double(subviews.count))
        
        for (index, subview) in subviews.enumerated() {
            let angle = angleStep * CGFloat(index) + rotation.radians
            
            // Find a vector with an appropriate size and rotation.
            var point = CGPoint(x: 0, y: -radius).applying(CGAffineTransform(rotationAngle: angle))
            
            // Shift the vector to the middle of the region.
            point.x += bounds.midX
            point.y += bounds.midY
            
            // Place the subview.
            subview.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
}
