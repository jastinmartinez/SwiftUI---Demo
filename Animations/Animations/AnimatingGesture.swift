//
//  AnimatingGesture.swift
//  Animations
//
//  Created by Jastin on 26/2/24.
//

import SwiftUI

struct AnimatingGesture: View {
    
    @State private var dragAmount = CGSize.zero
    @State private var isEnabled = false
    let letters  = Array("Hello SwiftUI")
    
    var body: some View {
        
        VStack {
            LinearGradient(colors: [.yellow, .red],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    withAnimation(.bouncy) {
                        dragAmount = .zero
                    }
                }
            )
            
            HStack(spacing: .zero) {
                ForEach(0..<letters.count, id:\.self) { index in
                    Text(String(letters[index]))
                        .padding(5)
                        .font(.title)
                        .background(isEnabled ? LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(colors: [.yellow, .red], startPoint: .leading, endPoint: .trailing))
                        .offset(dragAmount)
                        .animation(.linear.delay(Double(index) / 20), value: dragAmount)
                }
            }.gesture(DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    isEnabled.toggle()
                }
            )
        }
        
    }
}

#Preview {
    AnimatingGesture()
}
