//
//  WaitingRoomPlayerView.swift
//  Avalon
//
//  Created by Irakli Lomidze on 19.03.23.
//

import SwiftUI

struct WaitingRoomPlayerView: View {
    // MARK: - Properties
    @State var playerName: String
    var tag: Int? = nil
    var iconWidth: CGFloat = 44
    var iconHeight: CGFloat = 44
    var action: (Self) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Circle()
                .foregroundColor(.turquoiseBlue)
                .frame(width: iconWidth, height: iconHeight)
                .overlay(Text(getNameInitials(from: playerName))
                    .font(.nunito(type: .bold, size: 20))
                    .foregroundColor(.white))
            Text(playerName)
                .font(.nunito(type: .bold, size: 12))
                .foregroundColor(.fontNoteColor)
        }
        .onTapGesture {
            action(self)
        }
    }
}

// MARK: Public API
extension WaitingRoomPlayerView {
    mutating func setPlayerName(to name: String) {
        self.playerName = name
    }
}

// MARK: - Private Methods
private extension WaitingRoomPlayerView {
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
        
        return initials.uppercased()
    }
}

// MARK: - Preview
struct WaitingRoomPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        WaitingRoomPlayerView(playerName: "Player 1") { _ in 
            print("Tapped inside")
        }
    }
}
