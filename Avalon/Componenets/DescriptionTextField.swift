//
//  DescriptionTextField.swift
//  Avalon
//
//  Created by Irakli Lomidze on 10.12.22.
//

import SwiftUI


struct DescriptionTextField: View {
    var description: String = "Description"
    var placeHolder: String = "PlaceHolder"
    var color: Color = Color.gray
    var width: CGFloat = 170
    var height: CGFloat = 50
    var font: Font = .body
    var descriptionFont: Font?
    var placeHolderFont: Font?
    var hasUnderline: Bool = true
    
    let action: () -> Void
    
    
    @Binding var text: String
    
    var body: some View {
        
        VStack {
            HStack {
                Text(description)
                TextField(placeHolder, text: $text)
            }
            color
                .frame(width: width, height: 1, alignment: .center)
        }
    }
}

struct DescriptionTextField_Previews: PreviewProvider {
    @State var something: String = "something"
    static var previews: some View {
        DescriptionTextField(action: {
            
        }, text: .constant(""))
    }
}
