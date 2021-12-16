//
//  AlertViewController.swift
//  Example
//
//  Created by neutronstarer on 2020/8/25.
//  Copyright © 2020 neutronstarer. All rights reserved.
//

import UIKit
import UUNavigationController

class AlertViewController: UIViewController {
    
    override var animatorMaker: (UINavigationController.Operation) -> UIViewControllerAnimatedTransitioning{
        get {
            return { operation in
                return UUAlertAnimator(operation: operation)
            }
        }
        set {
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        let contentView = {()->UIView in
            let v = UIView()
            v.backgroundColor = UIColor.white
            let label = {()->UILabel in
               let v = UILabel()
                v.backgroundColor = UIColor(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1)
                v.textColor = UIColor.white
                v.textAlignment = .center
                v.text = "This is a alert"
                v.preferredMaxLayoutWidth = 288-28
                return v
            }()
            let button = {()->UIButton in
               let v = UIButton()
                v.backgroundColor = UIColor(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1)
                v.setTitle("Got it", for: .normal)
                v.setTitleColor(UIColor.white, for: .normal)
                v.setTitleColor(UIColor.gray, for: .highlighted)
                v.addTarget(self, action: #selector(click), for: .touchUpInside)
                
                return v
            }()
            v.addSubview(label)
            v.addSubview(button)
            label.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(14)
                make.leading.equalToSuperview().offset(14)
                make.trailing.equalToSuperview().offset(-14)
            }
            button.snp.makeConstraints { (make) in
                make.leading.equalToSuperview().offset(14)
                make.trailing.equalToSuperview().offset(-14)
                make.bottom.equalToSuperview().offset(-14)
                make.top.equalTo(label.snp_bottom).offset(14)
            }
            return v
        }()
        view.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalTo(288).priorityRequired()
        }
        // Do any additional setup after loading the view.
    }

    @objc func click() {
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
