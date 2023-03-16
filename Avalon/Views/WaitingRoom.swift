//
//  WaitingRoom.swift
//  Avalon
//
//  Created by Irakli Lomidze on 16.03.23.
//

import SwiftUI

struct WaitingRoom: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
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
                            VStack {
                                Circle()
                                    .foregroundColor(.turquoiseBlue)
                                    .frame(width: 63, height: 63)
                                    .overlay(Text(getNameInitials(from: item))
                                    .font(.nunito(type: .bold, size: 20))
                                    .foregroundColor(.white))
                                Text(item)
                                    .font(.nunito(type: .bold, size: 12))
                                    .foregroundColor(.fontNoteColor)
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
    
    /// Gets Initials From MULTIPLE Words
    func getNameInitials(from name: String) -> String {
        let words = name.components(separatedBy: .whitespaces).filter {
            !$0.isEmpty
        }
        if words.count == 0 {
            return "N/A"
        } else if words.count == 1 {
            let word = words.first!
            return getWordInitials(from: word, size: 2, separator: true)
        } else {
            let firstWord = words[0]
            let secondWord = words[1]
            return getWordInitials(from: firstWord, separator: true) + getWordInitials(from: secondWord)
        }
    }
    
    /// Gets Initials From SINGLE Word
    /// - Parameters:
    ///   - word: Text for which we want the initials
    ///   - size: size of the initials (if possible. if not - taking the max possible size)
    ///   - separator: whether or not add Dot in the end
    func getWordInitials(from word: String, size: Int = 1, separator: Bool = false) -> String {
        var initials: String
        var size = size
        
        if size > word.count {
            size = word.count
        }
        
        if word.count == 1 {
            initials = word.firstLetter
        } else {
            initials = word.substringWith(size: size)
        }
        
        if separator {
            initials = initials + .dot
        }
        
        return initials
    }
}

struct WaitingRoom_Previews: PreviewProvider {
    static var previews: some View {
        WaitingRoom()
    }
}
