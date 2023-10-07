//
//  Bin2DecButtonConverter.swift
//  Bin2DecUI
//
//  Created by Jastin on 7/10/23.
//

import SwiftUI
import Bin2Dec

struct Bin2DecButtonConverter: View {
    @Binding var binaryInput: String
    @Binding var binToDecResult: BinaryToDecimalConvertor.Result
    var body: some View {
        Button("Convert") {
            binToDecResult = BinaryToDecimalConvertor.convert(from: binaryInput)
        }
        .padding(7)
        .background(.blue)
        .foregroundStyle(.white)
        .cornerRadius(5)
    }
}

#Preview {
    Bin2DecButtonConverter(binaryInput: .constant(""),
                           binToDecResult: .constant(.none))
}
