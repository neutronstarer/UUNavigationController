//
//  ActionSheetViewController.swift
//  Example
//
//  Created by neutronstarer on 2020/8/25.
//  Copyright © 2020 neutronstarer. All rights reserved.
//

import UUNavigationController

class ActionSheetViewController: UIViewController {
    
    override var animatorMaker: (UINavigationController.Operation) -> UIViewControllerAnimatedTransitioning{
        get {
            return { operation in
                return UUActionSheetAnimator(operation: operation)
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
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        let contentView = {()->UIView in
            let v = UIView()
            let label = {()->UILabel in
                let v = UILabel()
                v.backgroundColor = UIColor(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1)
                v.textColor = UIColor.white
                v.textAlignment = .center
                v.text = "This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,This is a action sheet,"
//                v.preferredMaxLayoutWidth = UIScreen.main.bounds.size.width-88
                v.numberOfLines = 0
                return v
            }()
            let button = {()->UIButton in
                let v = UIButton()
                v.backgroundColor = UIColor(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1)
                v.setTitle("Got it", for: .normal)
                v.setTitleColor(UIColor.white, for: .normal)
                v.setTitleColor(UIColor.gray, for: .highlighted)
                v.addTarget(self, action: #selector(pop), for: .touchUpInside)
                return v
            }()
            v.addSubview(label)
            v.addSubview(button)
            label.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(14)
                make.leading.equalToSuperview().offset(14)
                make.trailing.equalToSuperview().offset(-14)
                make.width.equalTo(UIScreen.main.bounds.size.width-88)
            }
            button.snp.makeConstraints { (make) in
                make.top.equalTo(label.snp.bottom).offset(44)
                make.leading.equalToSuperview().offset(14)
                make.trailing.equalToSuperview().offset(-14)
                make.bottom.equalToSuperview().offset(0)
            }
            return v
        }()
        view.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            if #available(iOS 11.0, *) {
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            } else {
                // Fallback on earlier versions
                make.bottom.equalTo(view)
            }
        }
        // Do any additional setup after loading the view.
    }

    @objc func pop() {
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
