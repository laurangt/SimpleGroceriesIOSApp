//
//  CircularLayoutView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI

struct CircularLayoutView : Layout {

    let radius: CGFloat = (UIScreen.main.bounds.size.width * 2.0) / 6.0
//    @ObservedObject var setWorkoutViewModel: SetWorkoutViewModel


    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return proposal.replacingUnspecifiedDimensions()
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for (index, subview) in subviews.enumerated() {
            // Find a vector with an appropriate size and rotation.
            var point = CGPoint(x: 0, y: -radius)
                .applying(CGAffineTransform(
                    rotationAngle: 26 * Double(index)))

            // Shift the vector to the middle of the region.
            point.x += bounds.midX
            point.y += bounds.midY

            // Place the subview.
            subview.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
}

struct CircularLayout_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            CircularLayoutView{
                Text("Italian")
                Text("Vegan")
                Text("Desserts")
                Text("Asian")
                Text("American")
            }
            
        }
        
//        ZStack {
//            // Get the setworkoutmodel
//            let setWorkoutViewModel = PreviewWorkoutViewModels.defaultWorkout()
//            // Set the title on the center
//            Text(setWorkoutViewModel.title)
//            // Set a circular layout around the title
//            CircularLayoutView(setWorkoutViewModel: setWorkoutViewModel) {
//                // Prepare time
//                SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .prepareTime, fromSetWorkoutViewModel: setWorkoutViewModel))
//
//                // Sets
//                SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .sets, fromSetWorkoutViewModel: setWorkoutViewModel))
//
//                // Cycle rest
//                SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .restBetweenCycles, fromSetWorkoutViewModel: setWorkoutViewModel))
//
//                // Worktime
//                SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .workTime, fromSetWorkoutViewModel: setWorkoutViewModel))
//
//                // Cycles
//                SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .cycles, fromSetWorkoutViewModel: setWorkoutViewModel))
//
//                // Set rest
//                SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .restBetweenSets, fromSetWorkoutViewModel: setWorkoutViewModel))
//            }
//        }
    }
}
