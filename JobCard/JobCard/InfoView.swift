//
//  InfoView.swift
//  JobCard
//
//  Created by Jastin Martinez on 3/9/21.
//

import SwiftUI
struct InfoView: View {
    let iconName: String
    let textName: String
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame( height: 50)
            .overlay(
                HStack {
                    Image(systemName: iconName)
                        .foregroundColor(Color("primaryColor"))
                    Text(textName)
                }
            )
            .padding(.all)
    }
}
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(iconName: "phone.fill",textName: "Example")
            .previewLayout(.sizeThatFits)
    }
}
