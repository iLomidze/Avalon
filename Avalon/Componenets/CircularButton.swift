//
//  CircularButton.swift
//  Avalon
//
//  Created by Irakli Lomidze on 15.03.23.
//

import SwiftUI

struct CircularButton: View {
    enum ButtonType {
        case plus
        case minus
    }
    private let strokeWidthMult: CGFloat = 0.01
    private let lineLengthMult: CGFloat = 0.7
    
    let type: ButtonType
    let action: () -> Void
    
    var body: some View {
        Button(action: { action() }) {
            if type == .minus {
                Image("minusButtonIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.itemsColor)
            } else {
                Image("plusButtonIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.itemsColor)
            }
        }
    }
}

struct CircularButton_Previews: PreviewProvider {
    static var previews: some View {
        CircularButton(type: .plus) {
            print("Action was called")
        }
    }
}
