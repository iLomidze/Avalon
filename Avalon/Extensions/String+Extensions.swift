//
//  String+Extensions.swift
//  Avalon
//
//  Created by Irakli Lomidze on 17.03.23.
//

import Foundation

extension String {
    /// Empty String
    static var empty: String { get { return String() } }
    
    /// Whitespace
    static var space: String { get { return String(" ") } }
    
    /// Dot
    static var dot: String { get { return String(".") } }
    
    /// Get First Letter
    var firstLetter: String {
        String(self.prefix(1))
    }
    
    /// Gets Substring of Size
    /// - Parameter size: Number Of Letters
    func substringWith(size: Int) -> Self {
        String(self.prefix(size))
    }
}
