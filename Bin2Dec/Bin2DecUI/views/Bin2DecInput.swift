//
//  Bin2DecInput.swift
//  Bin2DecUI
//
//  Created by Jastin on 7/10/23.
//

import SwiftUI
import Combine

struct Bin2DecInput: View {
    @Binding var binaryInput: String
    var body: some View {
        VStack {
            Label(
                title: { Text("Binary").font(.title) },
                icon: { Image(.binary)
                        .resizable()
                        .frame(width: 40,
                               height: 40) }
            )
            TextField("0101010", text: $binaryInput)
                .font(.title2)
                .fixedSize()
                .keyboardType(.decimalPad)
                .onReceive(Just(binaryInput), perform: { newValue in
                    binaryInput = String(newValue.filter({$0.isNumber}).prefix(8))
                })
        }
    }
}

#Preview {
    Bin2DecInput(binaryInput: .constant(""))
}
