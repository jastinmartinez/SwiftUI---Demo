//
//  ContentView.swift
//  Animations
//
//  Created by Jastin on 25/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var scaleEffectValue = 1.0
    var body: some View {
//        Implicit animation
        Button("Tap Me") {
            scaleEffectValue += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(.circle)
        .scaleEffect(scaleEffectValue)
        .animation(.default, value: scaleEffectValue)
        .blur(radius: (scaleEffectValue - 1) * 2)
        
    }
}

#Preview {
    ContentView()
}
