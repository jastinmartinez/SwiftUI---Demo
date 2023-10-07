//
//  Bin2DecResultView.swift
//  Bin2DecUI
//
//  Created by Jastin on 7/10/23.
//

import SwiftUI
import Bin2Dec

struct Bin2DecResultView: View {
    @Binding var binToDecResult: BinaryToDecimalConvertor.Result
    var body: some View {
        Label(
            title: {
                switch binToDecResult {
                case .success(let decimal):
                    Bin2DecLabelResultView(value: decimal.formatted(),
                                           color: .green)
                case .failure(let error):
                    Bin2DecLabelResultView(value: error.localizedDescription,
                                           color: .red)
                case .none:
                    Bin2DecLabelResultView(value: "0.0",
                                           color: .gray)
                }
            },
            icon: { Image(.decimal)
                    .resizable()
                    .frame(width: 40,
                           height: 40) }
        )
    }
}

#Preview {
    Bin2DecResultView(binToDecResult: .constant(.none))
}
