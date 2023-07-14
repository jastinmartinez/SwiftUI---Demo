//
//  ContentView.swift
//  IDine
//
//  Created by Jastin on 13/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                let menuList = Bundle.main.decode([MenuSection].self, from: "menu.json")
                ForEach(menuList) { menu in
                    Section(menu.name) {
                        ForEach(menu.items) { item in
                            Text(item.name)
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
