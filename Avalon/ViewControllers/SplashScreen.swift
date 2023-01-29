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
            CircleTextLoader(text: LocalConsts.text,
                             fontStyle: LocalConsts.fontStyle,
                             circleColor: LocalConsts.circleColor,
                             textColor: LocalConsts.textColor)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + LocalConsts.splashScreenTime) {
                    self.isActive = true
                }
            }
        }
    }
}

private extension SplashScreen {
    enum LocalConsts {
        static var splashScreenTime = 2.0
        static let text = "AVALON"
        static let fontStyle = "AvenirNext-Heavy"
        static let circleColor: Color = .turquoiseBlue
        static let textColor: Color = .crustaOrange
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
