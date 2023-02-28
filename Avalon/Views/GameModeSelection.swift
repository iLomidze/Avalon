//
//  GameModeSelection.swift
//  Avalon
//
//  Created by Irakli Lomidze on 18.01.23.
//

import SwiftUI

struct GameModeSelection: View {
    @State private var action: destination? = .notPath
    
    var body: some View {
        ZStack {
            Color.backgroundColor
            
            VStack {
                NavigationLink(destination: Rooms(), tag: .singleDevice, selection: $action) {
                    EmptyView()
                }
                // TODO: To be implemented - destination
                NavigationLink(destination: EmptyView(), tag: .multipleDevice, selection: $action) {
                    EmptyView()
                }

                
                RoundedButton(title: "SINGLE DEVICE",
                              color: Color.crustaOrange,
                              width: 175,
                              height: 50) {
                    self.action = .singleDevice
                }
                              .padding(.top, 200)
                Spacer()
                RoundedButton(title: "MULTIPLE DEVICES",
                              color: Color.crustaOrange,
                              width: 175,
                              height: 50) {
                    self.action = .multipleDevice
                }
                              .padding(.bottom, 200)
                              .opacity(0.7)
                
                              .disabled(true)
            }
        }
    }
}

private extension GameModeSelection {
    enum destination: Int {
        case notPath
        case singleDevice
        case multipleDevice
    }
}


struct GameModeSelection_Previews: PreviewProvider {
    static var previews: some View {
        GameModeSelection()
    }
}
