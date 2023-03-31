//
//  UIKItManager.swift
//  Avalon
//
//  Created by Irakli Lomidze on 22.03.23.
//

import UIKit

final class UIKitManager {
    static func showViewController(viewController: UIViewController) {
        // Present
        UIApplication.shared.keyWindow?.rootViewController?.present(viewController, animated: true, completion: {
            // To completion action
        })
    }
}
