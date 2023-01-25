//
//  Navigator.swift
//  Avalon
//
//  Created by Irakli Lomidze on 18.01.23.
//

import SwiftUI

struct Navigator: View {
    private var activeScreen: (any View)!
    
    var body: some View {
        ZStack {
            Color.backgroundColor
        }
    }
}

extension Navigator {
    mutating func loadScreen(named screen: any View) {
        activeScreen = screen
    }
}

struct Navigator_Previews: PreviewProvider {
    static var previews: some View {
        Navigator()
    }
}
