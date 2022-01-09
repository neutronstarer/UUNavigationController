//
//  RootViewController.swift
//  Example
//
//  Created by neutronstarer on 2020/8/25.
//  Copyright © 2020 neutronstarer. All rights reserved.
//

import UIKit
import UUNavigationController

class RootViewController: UUNavigationController, UINavigationControllerDelegate {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.heroEnabled = true
        // Do any additional setup after loading the view.
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .pop:
            return fromVC.animatorMaker(operation)
        default:
            return toVC.animatorMaker(operation)
        }
    }
}

