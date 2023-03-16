//
//  AvalonApp.swift
//  Avalon
//
//  Created by Irakli Lomidze on 05.12.22.
//

import SwiftUI

@main
struct AvalonApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SplashScreen()
//                 TODO: Remove after debug
//                WaitingRoom()
            }
        }
    }
}
