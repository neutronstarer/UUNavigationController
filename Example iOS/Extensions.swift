//
//  UIViewControllerExtension.swift
//  Example iOS
//
//  Created by neutronstarer on 2021/11/25.
//

import Foundation
import UIKit
import UUNavigationController

var animatorMakerKey = "animatorMaker"

extension UIViewController {
    @objc
    var animatorMaker:(_ operation: UINavigationController.Operation) -> UIViewControllerAnimatedTransitioning {
        get {
            if let v = objc_getAssociatedObject(self, &animatorMakerKey) as? (_ operation: UINavigationController.Operation) -> UIViewControllerAnimatedTransitioning {
                return v
            }
            return { operation in
                return UUPushAnimator(operation: operation)
            }
        }
        set {
            objc_setAssociatedObject(self, &animatorMakerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

