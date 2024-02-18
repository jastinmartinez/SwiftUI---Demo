//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Jastin on 18/2/24.
//

import SwiftUI

struct ContentView: View {
    private let card = ["Rock","Paper","Scissors"]
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
