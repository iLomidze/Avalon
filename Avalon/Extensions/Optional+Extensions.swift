//
//  Optional+Extensions.swift
//  Avalon
//
//  Created by Irakli Lomidze on 19.03.23.
//

import SwiftUI

extension Optional where Wrapped == String {
    var orEmpty: String {
        self ?? .empty
    }
}
