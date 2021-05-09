//
//  SettingsInfoView.swift
//  FruitsApp
//
//  Created by Jastin on 7/5/21.
//

import SwiftUI

struct SettingsInfoView: View {
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination:String? = nil
    var body: some View {
        VStack {
            Divider().padding(.vertical,4)
            HStack {
                Text(name).foregroundColor(.gray)
                Spacer()
                if content != nil {
                    Text(content!)
                } else if (linkLabel != nil && linkDestination != nil){
                    Link(linkLabel!,destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                }
                else {
                    EmptyView()
                }
            }
        }
    }
}

struct SettingsInfoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsInfoView(name: "Developer", content: "Jastin Martinez")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            SettingsInfoView(name: "Example", linkLabel: "Aaaa", linkDestination: "wikipedia.com")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
                .preferredColorScheme(.dark)
        }
    }
}
