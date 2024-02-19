//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Jastin on 18/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var score = Score.make()
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Card.list(), id: \.self) { card in
                    Button() {
                        switch Game.pick(first: card, second: Card.random()) {
                        case .match:
                            score.add()
                        case .equal:
                            score.next()
                        case .fail:
                            score.remove()
                        }
                    } label: {
                        Text(card.description)
                    }.clipShape(.rect)
                        .shadow(radius: 5)
                }
            }
            .padding()
            Text("Score: \(score.points)")
            Text("Round: \(score.rounds)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
