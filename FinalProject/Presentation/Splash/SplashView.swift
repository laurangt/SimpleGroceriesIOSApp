//
//  SplashView.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 2/8/23.
//

import SwiftUI

struct SplashView: View {    
    
    var body: some View {
        LottieView(loopMode: .loop)
            .scaleEffect(0.4)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
