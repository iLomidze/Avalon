//
//  GameModeSelection.swift
//  Avalon
//
//  Created by Irakli Lomidze on 18.01.23.
//

import SwiftUI

struct GameModeSelection: View {
    var body: some View {
        ZStack {
            Color.backgroundColor
            
            VStack {
                RoundedButton(title: "SINGLE DEVICE",
                              color: Color.crustaOrange,
                              width: 175,
                              height: 50) {
                }
                    .padding(.top, 200)
                Spacer()
                RoundedButton(title: "MULTIPLE DEVICES",
                              color: Color.crustaOrange,
                              width: 175,
                              height: 50) {
                }
                    .padding(.bottom, 200)
                    .opacity(0.7)
                
                .disabled(true)
            }
        }
    }
}

struct GameModeSelection_Previews: PreviewProvider {
    static var previews: some View {
        GameModeSelection()
    }
}
