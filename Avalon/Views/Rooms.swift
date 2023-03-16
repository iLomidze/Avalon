//
//  Rooms.swift
//  Avalon
//
//  Created by Irakli Lomidze on 06.12.22.
//

import SwiftUI

struct Rooms: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var isDestinationSet: Bool? = false
    
    var body: some View {
        ZStack {
            Color.backgroundColor
            VStack {
                NavigationLink(destination: WaitingRoom(), tag: true, selection: $isDestinationSet) {
                    EmptyView()
                }
                
                NumberOfPlayersPicker()
                    .padding(.bottom, 40)
                DescTextWithHorizAction(text: "Lady Of The Lake", color: .itemsColor)
                    .padding(.bottom, 40)
                DescTextWithHorizAction(text: "Fast Game Mode", color: .itemsColor)
                Spacer()
                RoundedButton(title: "CREATE ROOM",
                              color: .crustaOrange,
                              width: 175,
                              height: 50) {
                    isDestinationSet = true
                }
            }
    //            .frame(height: 40.0)
                .tint(.turquoiseBlue)
                .padding(.horizontal, 50)
                .padding(.vertical, 50)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            Image("backArrow").tint(Color.navigationIconColor)
    })
    }
}

struct Rooms_Previews: PreviewProvider {
    static var previews: some View {
        Rooms()
    }
}
