//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Jastin on 18/2/24.
//

import SwiftUI

struct ContentView: View {
    
    private let cards = Card.list()
    private let game = Game()
   
    @State private var isMatch: Bool = false
    
    var body: some View {
        HStack {
            ForEach(cards, id: \.self) { card in
                CardButton(card: card, game: game)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct CardButton: View {
    
    private let card: Card
    private let game: Game
    
    init(card: Card, game: Game) {
        self.card = card
        self.game = game
    }
    
    var body: some View {
        Button() {
            let picked = game.pickCard(first: card, second: Card.random())
            switch picked {
            case .match:
                game.addPoint()
            case .equal:
                break
            case .fail:
                game.removePoint()
            }
        } label: {
            Image(card.icon)
                .resizable()
                .frame(width: 100, height: 100)
        }.clipShape(.rect)
            .shadow(radius: 5)
            .border(.background)
    }
}
