//
//  ContentView.swift
//  Bin2DecUI
//
//  Created by Jastin on 5/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Spacer()
                Label(
                    title: { Text("Binary").font(.title) },
                    icon: { Image(.binary)
                            .resizable()
                            .frame(width: 40,
                                   height: 40) }
                )
                TextField("0101010", text: $text)
                    .font(.title2)
                    .fixedSize()
                
                Button("Convert") {
                    print("")
                }
                .padding(7)
                .background(.blue)
                .foregroundStyle(.white)
                .cornerRadius(5)
                Spacer()
                Label(
                    title: { Text("\(0)")
                            .font(.title)
                        .fontWeight(.semibold) },
                    icon: { Image(.decimal)
                            .resizable()
                            .frame(width: 40,
                                   height: 40) }
                )
            }
        }.navigationTitle("Bin2Dec")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
