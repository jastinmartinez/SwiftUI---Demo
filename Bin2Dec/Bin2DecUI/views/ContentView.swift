//
//  ContentView.swift
//  Bin2DecUI
//
//  Created by Jastin on 7/10/23.
//

import SwiftUI
import Bin2Dec

struct ContentView: View {
    @State var binaryInput: String = ""
    @State var binToDecResult: BinaryToDecimalConvertor.Result = .none
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Spacer()
                Bin2DecInput(binaryInput: $binaryInput)
                
                Bin2DecButtonConverter(binaryInput: $binaryInput,
                                       binToDecResult: $binToDecResult)
                Spacer()
                Bin2DecResultView(binToDecResult: $binToDecResult)
            }
        }.navigationTitle("Bin2Dec")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
