//
//  OnBoardingView.swift
//  FruitsApp
//
//  Created by Jastin on 3/5/21.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        TabView {
            ForEach(0..<5) { item in
                FruitCardView(fruit: fruistData[item])
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical,20)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
      OnBoardingView()
    }
}
