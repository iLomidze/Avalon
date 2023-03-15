//
//  NumberOfPlayersPicker.swift
//  Avalon
//
//  Created by Irakli Lomidze on 15.03.23.
//

import SwiftUI

struct NumberOfPlayersPicker: View {
    @State private var numberOfPlayers = 1
    
    var body: some View {
        VStack {
            HStack {
                Text("Player")
                    .font(.nunito(type: .italic, size: 16.0))
                Spacer()
                CircularButton(type: .minus, action: {
                    changeNumberOfPlayers(via: .minus)
                })
                .frame(width: 25.0)
                Text(String(numberOfPlayers))
                    .foregroundColor(.itemsColor)
                    .font(.nunito(type: .bold, size: 20.0))
                    .padding(.horizontal, 20)
                CircularButton(type: .plus, action: {
                    changeNumberOfPlayers(via: .plus)
                })
                .frame(width: 25.0)
            }
            Color.itemsColor.frame(height: 1.0)
        }
    }
    
    private func changeNumberOfPlayers(via buttonType: CircularButton.ButtonType) {
        if buttonType == .minus && numberOfPlayers > 1 {
            numberOfPlayers -= 1
        } else if buttonType == .plus {
            numberOfPlayers += 1
        }
    }
}

struct NumberOfPlayersPicker_Previews: PreviewProvider {
    static var previews: some View {
        NumberOfPlayersPicker()
    }
}
