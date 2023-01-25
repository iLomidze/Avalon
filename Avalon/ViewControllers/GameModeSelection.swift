//
//  GameModeSelection.swift
//  Avalon
//
//  Created by Irakli Lomidze on 18.01.23.
//

import SwiftUI

struct GameModeSelection: View {
    var body: some View {
        RoundedButton(title: "SINGLE DEVICE",
                      color: Color.crustaOrange,
                      width: 170,
                      height: 50) {
        }
    }
}

struct GameModeSelection_Previews: PreviewProvider {
    static var previews: some View {
        GameModeSelection()
    }
}
