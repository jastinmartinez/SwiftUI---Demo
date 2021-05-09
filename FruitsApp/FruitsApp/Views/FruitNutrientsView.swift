//
//  FruitNutrientsView.swift
//  FruitsApp
//
//  Created by Jastin on 7/5/21.
//

import SwiftUI

struct FruitNutrientsView: View {
    var fruit: Fruit
    let nutrients = ["Energy","Sugar","Fat","Protein","Vitamins","Minerals"]
    var body: some View {
        GroupBox() {
            DisclosureGroup("Nutrional value per 100g"){
                ForEach(0..<nutrients.count, id: \.self) { index in
                    Divider().padding(.vertical,2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[index])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        .font(Font.system(.body).bold())
                        Spacer(minLength: 25)
                        Text(fruit.nutrition[index])
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}

struct FruitNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrientsView(fruit: fruistData[0])
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
