//
//  DescTextWithHorizAction.swift
//  Avalon
//
//  Created by Irakli Lomidze on 09.03.23.
//

import SwiftUI

struct DescTextWithHorizAction: View {
    @State var isOn = false
    
    var text: String = "Description"
    var color: Color = .blue
    
    private let fontSize: CGFloat = 16.0
    
    var body: some View {
        ZStack {
            VStack {
                Toggle(text, isOn: $isOn)
                    .font(.nunito(type: .italic, size: fontSize))
                color
                    .frame(height: 1.0)
                    
            }
        }
    }
}

//private struct ToggleColorModifier: ViewModifier {
//    let color: Color
//
//    func body(content: Content) -> some View {
//        content
//            .tint(color)
//    }
//}
//
//extension DescriptionTextField {
//    func toggleOnTint(color: Color) -> some View {
//        self.modifier(ToggleColorModifier(color: color))
//    }
//}


struct DescTextWithHorizAction_Previews: PreviewProvider {
    static var previews: some View {
        DescTextWithHorizAction(text: "Text")
    }
}
