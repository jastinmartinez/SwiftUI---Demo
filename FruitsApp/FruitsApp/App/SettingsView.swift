//
//  SettingsView.swift
//  FruitsApp
//
//  Created by Jastin on 7/5/21.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnBoarding") var isOnBoarding: Bool = false
    var body: some View {
        NavigationView {
            ScrollView(.vertical,showsIndicators: false)
            {   VStack(spacing: 20) {
                GroupBox(label:  SettingsLabelView(labelText: "Fruits", labelImage: "info.circle"), content: {
                    Divider().padding(.vertical,4)
                    
                    HStack(alignment: .center, spacing: 10, content: {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80,height: 80)
                            .cornerRadius(9)
                        Text("Most Fruit are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essentials nutrients, including potassium, dietary, fiber, vitamins and much ore")
                            .font(.footnote)
                    })
                })
                
                GroupBox(label:SettingsLabelView(labelText: "Customization", labelImage: "paintbrush") , content: {
                    Divider().padding(.vertical,4)
                    Text("You can restart application by toggle switch in this box.")
                        .padding(.vertical,8)
                        .frame(minHeight: 60)
                        .layoutPriority(1)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    Toggle(isOn: $isOnBoarding, label: {
                        if isOnBoarding {
                            Text("Restarted".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        } else {
                            Text("Restart".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                        }
                    })
                    .padding()
                    .background(
                        Color(UIColor.tertiarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 8,style: .continuous))
                })
                
                GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone"), content: {
                    SettingsInfoView(name: "Developer", content: "Jastin Martinez")
                    SettingsInfoView(name: "Compatibility", content: "IOS 13/14")
                    SettingsInfoView(name: "Linkedin", linkLabel: "Jastin Martinez",linkDestination: "www.linkedin.com/in/jastin-martinez-868339143")
                    SettingsInfoView(name: "Twitter", linkLabel: "martinez_jastin",linkDestination: "twitter.com/martinez_jastin")
                    SettingsInfoView(name: "SwiftUI",content: "2.0")
                    SettingsInfoView(name: "Version",content: "1.0" )
                    
                })
            }
            .navigationBarTitle(Text("Settings"),displayMode: .large)
            .navigationBarItems(trailing: Button(action: {  
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
            })
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
