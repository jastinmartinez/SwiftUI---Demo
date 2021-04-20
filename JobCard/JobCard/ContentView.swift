//
//  ContentView.swift
//  JobCard
//
//  Created by Jastin Martinez on 3/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("primaryColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("me").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white,lineWidth: 5)
                    )
                
                Text("Jastin Martinez")
                    .font(Font.custom("Pacifico-Regular", fixedSize: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("IOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                
                InfoView(iconName: "phone.fill", textName: "809-973-7295")
                InfoView(iconName: "envelope.fill", textName: "martinez.jastin@hotmail.com")
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


