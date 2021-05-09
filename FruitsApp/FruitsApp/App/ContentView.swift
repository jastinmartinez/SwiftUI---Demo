//
//  ContentView.swift
//  FruitsApp
//
//  Created by Jastin on 2/5/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingSetting: Bool = false
    var fruits:[Fruit] = fruistData
    var body: some View {
        NavigationView{
            List{
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(
                        destination: FruitDetailView(fruit: item))
                    {
                        FruitRowView(fruit: item)
                            .padding(.vertical,4)
                    }
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(trailing: Button(action: {
                isShowingSetting = true
            })  {
                Image(systemName: "slider.horizontal.3")
            }).sheet(isPresented:$isShowingSetting){
                SettingsView()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruistData)
    }
}
