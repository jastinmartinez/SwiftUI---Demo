//
//  IDineApp.swift
//  IDine
//
//  Created by Jastin on 13/7/23.
//

import SwiftUI

@main
struct IDineApp: App {
 
    var body: some Scene {
        WindowGroup {
            @StateObject var order = Order()
            ContentView()
                .environmentObject(order)
        }
    }
}
