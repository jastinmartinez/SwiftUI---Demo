//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jastin on 27/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland","Russia","Spain","UK","US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var isShowingAlertScore = false
    
    @State private var titleScore = ""
    
    @State private var score = 0
    
    var body: some View {
        
        ZStack {
            Spacer()
            RadialGradient(stops:[.init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3)], center: .top, startRadius: 150, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Text("Guess the flag")
                    .foregroundColor(.white)
                    .font(.largeTitle.weight(.bold))
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundColor(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            tappedFlag(number)
                        }label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow( radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical,20)
                .background(.regularMaterial)
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.largeTitle.weight(.bold))
                
                Spacer()
            }
            .padding()
        }
        .alert(titleScore, isPresented: $isShowingAlertScore) {
            
            Button("Continue",action: askeNextQuestion)
            
        }
    }
    
    func tappedFlag(_ number: Int) {
        
        if number == correctAnswer {
            titleScore = "Correct 🤣"
            score += 1
        }
        else {
            titleScore = "Wrong 😪"
        }
        
        isShowingAlertScore = true
    }
    
    func askeNextQuestion() {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
