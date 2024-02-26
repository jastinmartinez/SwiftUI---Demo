//
//  AnimationTransition.swift
//  Animations
//
//  Created by Jastin on 26/2/24.
//

import SwiftUI

struct AnimationTransition: View {
    
    @State private var isRectangleShowing = false
    var body: some View {
        VStack {
            Button("Show Rectangle") {
                withAnimation {
                    isRectangleShowing.toggle()
                }
            }
            
            if isRectangleShowing {
                Rectangle()
                    .frame(width: 300, height: 200)
                    .foregroundColor(.red)
                    .rotationEffect(.degrees(isRectangleShowing ? 5 : 0))
                    .transition(.asymmetric(insertion: .slide, removal: .opacity))
            }
        }
    }
}

#Preview {
    AnimationTransition()
}
