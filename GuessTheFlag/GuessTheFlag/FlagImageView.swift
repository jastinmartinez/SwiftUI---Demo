//
//  FlagImageView.swift
//  GuessTheFlag
//
//  Created by Jastin on 11/2/24.
//

import SwiftUI

struct FlagImageView: View {
    let number: Int
    let flagTapped: (Int) -> Void
    let countries: [String]
    
    var body: some View {
        Button {
            flagTapped(number)
        } label: {
            Image(countries[number])
        }.clipShape(.capsule)
            .shadow(radius: 5)
    }
}
#Preview {
    FlagImageView(number: 0, flagTapped: { _ in }, countries: [])
}
