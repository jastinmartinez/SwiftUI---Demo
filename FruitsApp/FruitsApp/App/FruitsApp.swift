//
//  FruitsAppApp.swift
//  FruitsApp
//
//  Created by Jastin on 2/5/21.
//

import SwiftUI

@main
struct FruitsApp: App {
    @AppStorage("isOnBoarding") var isOnBoarding: Bool = true
    var body: some Scene {
        WindowGroup {
            if isOnBoarding {
                OnBoardingView()
            }
            else {
            ContentView()
            }
        }
    }
}
