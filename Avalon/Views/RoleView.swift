//
//  RoleView.swift
//  Avalon
//
//  Created by Irakli Lomidze on 31.03.23.
//

import SwiftUI
import CardFlip

struct RoleView: View {
    var body: some View {
        ZStack {
            Color.backgroundColor
            
            VStack {
                Text("Player Name")
                    .font(.nunito(type: .bold, size: 28))
                    .foregroundColor(.fontColor)
                    .padding(.top)
                Text("Your Role Is")
                    .font(.nunito(type: .bold, size: 20))
                    .foregroundColor(.fontColor)
                
                CardFlip(
                    width: 250,
                    height: 400,
                    frontImage: Image("front"),
                    backImage: Image("back"))
                    .padding(.top, 65)
                
                Spacer()
                
                RoundedButton(title: "START GAME",
                              color: .crustaOrange,
                              width: 175,
                              height: 50) {
//                    destination = true
                }
                              .padding(.bottom, 55)
            }
        }
    }
}

struct RoleView_Previews: PreviewProvider {
    static var previews: some View {
        RoleView()
    }
}
