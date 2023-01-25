//
//  Binding+Extensions.swift
//  Avalon
//
//  Created by Irakli Lomidze on 10.12.22.
//

import SwiftUI

extension Binding {
    /// Setting value - for previews
    public static func variable(_ value: Value) -> Binding<Value> {
        var state = value
        return Binding<Value> {
            state
        } set: {
            state = $0
        }
    }
}

extension Binding {
    /// Setting default value to the optional
    public func defaultValue<T>(_ value: T) -> Binding<T> where Value == Optional<T> {
        Binding<T> {
            wrappedValue ?? value
        } set: {
            wrappedValue = $0
        }
    }
}

extension Binding where Value == Optional<String> {
    /// Setting default empty string value to the optional string
    public var orEmpty: Binding<String> {
        Binding<String> {
            wrappedValue ?? ""
        } set: {
            wrappedValue = $0
        }
    }
}
