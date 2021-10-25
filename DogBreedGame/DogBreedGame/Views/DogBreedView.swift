//
//  ContentView.swift
//  DogBreedGame
//
//  Created by Jastin on 24/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            VStack {
                
                Text("is this a Toy?")
                Image("dog")
                    .resizable()
                    .frame(width: 250, height: 250, alignment: .center)
                    .cornerRadius(50)
                
            
                
               
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
