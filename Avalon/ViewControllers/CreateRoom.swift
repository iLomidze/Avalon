//
//  CreateRoom.swift
//  Avalon
//
//  Created by Irakli Lomidze on 06.12.22.
//

import SwiftUI

struct CreateRoom: View {
    @State var roomNumber = " # # # #"
    
    var body: some View {
        ZStack {
            Color.backgroundColor
            
            VStack {
                Spacer()
                
                RoundedButton(title: "CREATE ROOM",
                              color: Color.crustaOrange,
                              width: 170,
                              height: 50) {
                }
                
                Spacer()
                
                HStack(alignment: .center, spacing: 25) {
                    Text("Room Code/")
                        .font(Font.roboto(type: .mediumItalic, size: 11))
                        .foregroundColor(Color.stormGrey)
                    TextField("# # # #", text: $roomNumber)
                        .font(Font.roboto(type: .medium, size: 16))
                        .foregroundColor(Color.stormGrey)
                }
                .frame(width: 170.0)

                Color.stormGrey
                    .frame(width: 170, height: 1, alignment: .center)
                    .padding(.bottom, 10)
                    .offset(y: -8)
                
                RoundedButton(title: "JOIN ROOM",
                              color: Color.turquoiseBlue,
                              width: 170,
                              height: 50) {
                    
                }
                .padding(.bottom, 55)
            }
        }
        .ignoresSafeArea()
    }
}

struct CreateRoom_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CreateRoom()
                .previewDevice("iPod touch (7th generation)")
                .preferredColorScheme(.dark)
            CreateRoom()
                .previewDevice("iPhone 13 Pro")
        }
    }
}
