//
//  TextFieldPopUp.swift
//  Avalon
//
//  Created by Irakli Lomidze on 19.03.23.
//

import SwiftUI

struct TextFieldPopUp: View {
    @State private var showingAlert = false
    @State private var textFieldValue = ""
    
    var placeHolder = ""
    
    let saveAction: (String) -> Void
    let cancelAction: () -> Void
    
    private var playerName: String {
        return textFieldValue.isEmpty ? "Player Name" : textFieldValue
    }
    
    private var placeHolderInUse: String {
        placeHolder.isEmpty ? "Player Name" : placeHolder
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ZStack {
                    Color.brightGrey.cornerRadius(10, corners: [.topLeft, .topRight])
                        .frame(height: 62)
                    
                    Text(playerName)
                        .font(.nunito(type: .boldItalic, size: 16))
                        .foregroundColor(.fontNavigationColor)
                }
                
                ZStack {
                    Color.whiteSmoke.cornerRadius(10, corners: [.bottomLeft, .bottomRight])
                    
                    VStack(spacing: 20) {
                        TextField(placeHolderInUse, text: $textFieldValue)
                            .font(.nunito(type: .bold, size: 14.0))
                            .foregroundColor(.fontColor)
                            .multilineTextAlignment(.center)
                            .frame(width: 120, height: 44)
                        .autocorrectionDisabled(true)
                        
                        HStack(spacing: 30) {
                            RoundedButton(title: "Save",
                                          color: .turquoiseBlue,
                                          width: 100,
                                          height: 50,
                                          font: .roboto(type: .bold, size: 14)) {
                                saveAction(textFieldValue)
                            }
                            
                            RoundedButton(title: "Cancel",
                                          color: .crustaOrange,
                                          width: 100,
                                          height: 50,
                                          font: .roboto(type: .bold, size: 14)) {
                                cancelAction()
                            }
                        }
                    }
                }
            }
        }
    }
}


struct TextFieldPopUp_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldPopUp { text in
            print("Save with \(text)")
            
        } cancelAction: {
            print("Cancel")
        }
    }
}
