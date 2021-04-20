//
//  ContentView.swift
//  Dice-SwiftUI
//
//  Created by Jastin Martinez on 3/9/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDice = 1
    @State var rightDice = 1
    var body: some View {
        
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    diceView(number: leftDice)
                    diceView(number: rightDice)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    leftDice = Int.random(in: 1...6)
                    rightDice = Int.random(in: 1...6)
                }, label: {
                    Text("Roll").font(.system(size: 50)).fontWeight(.heavy).foregroundColor(.white)
                        .padding()
                }
                ).background(Color.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct diceView: View {
    var number: Int
    var body: some View {
        Image("dice\(number)")
            .resizable()
            .aspectRatio(1,contentMode: .fit)
            .padding()
    }
}
