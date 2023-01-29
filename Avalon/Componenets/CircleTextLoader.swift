//
//  CircleTextLoader.swift
//  Avalon
//
//  Created by Irakli Lomidze on 27.01.23.
//

import SwiftUI

struct CircleTextLoader: View {
    @State private var scaleCoefficient = 0.4
    @State private var textOpacity = 0.6
    @State private var tracking = 0.1
    @State private var circleFill = 0.0
    
    private var text: String
    private var fontStyle: String
    private var animDuration = 1.0
    private var circleColor: Color
    private let textColor: Color
    private let circleLineWidth: Double
    private let textSize: CGFloat
    
    init(text: String, fontStyle: String, circleColor: Color, scaleStartCoeff: Double = 0.4, textOpacityStart: Double = 0.6, animDuration: Double = 1.0, textColor: Color = .black, circleLineWidth: Double = 30, textSize: CGFloat = 36) {
        self.text = text
        self.fontStyle = fontStyle
        self.scaleCoefficient = scaleStartCoeff
        self.textOpacity = textOpacityStart
        self.animDuration = animDuration
        self.circleColor = circleColor
        self.textColor = textColor
        self.circleLineWidth = circleLineWidth
        self.textSize = textSize
    }
    
    var body: some View {
        ZStack {
            // Track Circle
            Circle()
                .stroke(Color.blue.opacity(0.3),
                        style: StrokeStyle(lineWidth: circleLineWidth))
                .padding(50)
            
            // Animation Circle
            Circle()
                .trim(from: 0, to: circleFill)
                .stroke(circleColor,
                        style: StrokeStyle(lineWidth: circleLineWidth))
                .rotationEffect(.degrees(90))
                .padding(50)
            Circle()
                .trim(from: 0, to: circleFill)
                .stroke(circleColor,
                        style: StrokeStyle(lineWidth: circleLineWidth))
                .rotationEffect(.degrees(90))
                .rotation3DEffect(.degrees(180.0), axis: (x: 0, y: 1, z: 0))
                .padding(50)
            
            Text(text)
                .font(Font.custom(fontStyle, size: textSize))
                .scaleEffect(scaleCoefficient)
                .opacity(textOpacity)
            // TODO: Add tracking/check afterwards
//                .if(.iOS16) { view in
//                    view.tracking(tracking)
//                }
                .onAppear {
                    DispatchQueue.main.async {
                        withAnimation(.easeIn(duration: animDuration)) {
                            self.scaleCoefficient = 1.0
                            self.textOpacity = 1.0
                            self.tracking = 1.5
                            self.circleFill = 0.5
                        }
                    }
                }
        }
    }
}

struct CircleTextLoader_Previews: PreviewProvider {
    static var previews: some View {
        CircleTextLoader(text: "TexT", fontStyle: "AvenirNext-Heavy", circleColor: .crustaOrange, textColor: .black)
    }
}
