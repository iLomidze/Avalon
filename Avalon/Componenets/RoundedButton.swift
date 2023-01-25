//
//  RoundedButton.swift
//  Avalon
//
//  Created by Irakli Lomidze on 07.12.22.
//

import SwiftUI

struct RoundedButton: View {
    var title: String = "Button"
    var color: Color = Color.gray
    var width: CGFloat = 170
    var height: CGFloat = 50
    var font: Font = Font.roboto(type: .bold)
    
    let action: () -> Void
    
    var body: some View {
        Button(action: { action() }) {
            Text(title)
                .font(font)
                .padding()
                .foregroundColor(.white)
        }
        .frame(width: width, height: height, alignment: .center)
        .background(color)
        .cornerRadius(10)
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(title: "Rounded Button",
                      color: .cyan,
                      width: 150,
                      height: 32,
                      font: .system(size: 16, weight: .regular, design: .default)) {
            // Some Action here
        }
    }
}
