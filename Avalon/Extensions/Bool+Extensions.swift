//
//  Bool+Extensions.swift
//  Avalon
//
//  Created by Irakli Lomidze on 28.01.23.
//

import Foundation

extension Bool {
    static var iOS16: Bool {
        guard #available(iOS 16, *) else { return false }
        return true
    }
}
