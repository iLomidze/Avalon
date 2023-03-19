//
//  UIViewController+Extensions.swift
//  Avalon
//
//  Created by Irakli Lomidze on 20.03.23.
//

import UIKit

extension UIViewController {
    /// Present in Active Window
    func presentInKeyWindow(animated: Bool = true, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.rootViewController?
                .present(self, animated: animated, completion: completion)
        }
    }
    
    /// Present in Active Controller
    func presentInKeyWindowPresentedController(animated: Bool = true, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            UIApplication.shared.keyWindowPresentedController?
                .present(self, animated: animated, completion: completion)
        }
    }
}
