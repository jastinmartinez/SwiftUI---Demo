//
//  Bin2DecLabelResultView.swift
//  Bin2DecUI
//
//  Created by Jastin on 7/10/23.
//

import SwiftUI

struct Bin2DecLabelResultView: View {
    let value: String
    let color: Color
    var body: some View {
        Text(value)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(color)
    }
}

#Preview {
    Bin2DecLabelResultView(value: "0.0",
                           color: .gray)
}
