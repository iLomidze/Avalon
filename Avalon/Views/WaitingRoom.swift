//
//  WaitingRoom.swift
//  Avalon
//
//  Created by Irakli Lomidze on 16.03.23.
//

import SwiftUI

struct WaitingRoom: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var blabla: String = .empty
    
    private let numbOfColumns = 3
    private let numbOfPlayers = 10
    private var playerNames: [String] = []
    private var gridItems: [String] = []
    
    init() {
        generatePlayerNamesArray()
        generateGridItems()
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor
            VStack {
                Text("Players")
                    .font(.nunito(type: .bold, size: 14))
                    .foregroundColor(.fontNoteColor)
                    .padding(.top)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())],
                          spacing: 17) {
                    ForEach(gridItems, id: \.self) { item in
                        if item.isEmpty {
                            Circle()
                                .foregroundColor(.backgroundColor)
                        } else {
                            WaitingRoomPlayerView(playerName: item, iconWidth: 63, iconHeight: 63) {
                            // TODO: change player name
                            }
                        }
                    }
                }
                .padding(.top, 25)
                .padding(.horizontal)
                
                Spacer()
                
                RoundedButton(title: "START GAME",
                              color: .crustaOrange,
                              width: 175,
                              height: 50) {
                    // TODO: Add go to next screen action
                }
                              .padding(.bottom, 55)
            }
            .overlay(alignment: .center) {
                TextField("Enter Player Name", text: $blabla)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            Image("backArrow").tint(Color.navigationIconColor)
        })
    }
}

private extension WaitingRoom {
    /// Generates Initial Player Names
    mutating func generatePlayerNamesArray() {
        for i in 1...numbOfPlayers {
            playerNames.append("Player \(i)")
        }
    }
    
    /// Generates Array for Grid
    /// Need for Stylising The Grid Items Configuration
    mutating func generateGridItems() {
        gridItems = playerNames
        if playerNames.count % numbOfColumns == 1 {
            gridItems.insert(.empty, at: numbOfPlayers - 1)
        }
        if playerNames.count % numbOfColumns == 2 {
            gridItems.insert(.empty, at: numbOfPlayers - 2)
        }
    }
}

struct WaitingRoom_Previews: PreviewProvider {
    static var previews: some View {
        WaitingRoom()
    }
}
