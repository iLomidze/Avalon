//
//  SplashScreen.swift
//  Avalon
//
//  Created by Irakli Lomidze on 20.01.23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            NavigationView {
                GameModeSelection()
            }
        } else {
            Image("splashScreen")
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + LocalVariables.splashScreenTime) {
                        self.isActive = true
                    }
                }
        }
    }
}

private extension SplashScreen {
    enum LocalVariables {
        static var splashScreenTime = 2.0
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
