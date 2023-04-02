//
//  WaitingRoom.swift
//  Avalon
//
//  Created by Irakli Lomidze on 16.03.23.
//

import SwiftUI

struct WaitingRoom: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var destination: Bool? = false
    
    @State private var showAlert: Bool = false
    @State private var selectedPlayer: WaitingRoomPlayerView? = nil
    
    private let numbOfColumns = 3
    private let numbOfPlayers = 10
    @State private var playerNames: [String] = []
    @State private var gridItems: [String] = [] // Only for the visual side (some items may be blank)
    
    init() {
        generatePlayerNamesArray()
        generateGridItems()
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor
            
            NavigationLink(destination: RoleView(), tag: true, selection: $destination) {
                EmptyView()
            }
            
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
                            WaitingRoomPlayerView(playerName: item,
                                                  tag: getTag(from: item),
                                                  iconWidth: 63,
                                                  iconHeight: 63) { component in
                                showAlert.toggle()
                                self.selectedPlayer = component
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
                    destination = true
                }
                              .padding(.bottom, 55)
            }
            if showAlert {
                TextFieldPopUp(saveAction: { name in
                    showAlert.toggle()
                    if let selectedPlayer {
                        selectedPlayer.playerName = name
                        guard let tag = selectedPlayer.tag else {
                            fatalError("Tag must be set for this object")
                        }
                        playerNames[(tag - 1)] = name
                    }
                }, cancelAction: {
                    showAlert.toggle()
                })
                    .frame(height: 200)
                    .padding(.horizontal, 30)
            }
        }
        .onAppear {
            generatePlayerNamesArray()
            generateGridItems()
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
    func generatePlayerNamesArray() {
        for i in 1...numbOfPlayers {
            playerNames.append("Player \(i)")
        }
    }
    
    /// Generates Array for Grid
    /// Need for Stylising The Grid Items Configuration
    func generateGridItems() {
        gridItems = playerNames
        if playerNames.count % numbOfColumns == 1 {
            gridItems.insert(.empty, at: numbOfPlayers - 1)
        }
        if playerNames.count % numbOfColumns == 2 {
            gridItems.insert(.empty, at: numbOfPlayers - 2)
        }
    }
    
    func getTag(from text: String) -> Int {
        guard let strNumb = text.components(separatedBy: .whitespaces).last else {
            fatalError("Wrong Player name - cant get second string (player number)")
        }
        guard let number = Int(strNumb) else {
            fatalError("Wrong Player name - second word should be number")
        }
        return number
    }
}

struct WaitingRoom_Previews: PreviewProvider {
    static var previews: some View {
        WaitingRoom()
    }
}
