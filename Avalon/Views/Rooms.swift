//
//  Rooms.swift
//  Avalon
//
//  Created by Irakli Lomidze on 06.12.22.
//

import SwiftUI

struct Rooms: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
