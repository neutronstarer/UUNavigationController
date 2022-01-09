//
//  SearchViewController.swift
//  Example iOS
//
//  Created by neutronstarer on 2021/12/16.
//

import UIKit
import SnapKit
import UUNavigationController

class SearchViewController: UIViewController {
    
    override var animatorMaker: (UINavigationController.Operation) -> UIViewControllerAnimatedTransitioning{
        get {
            return { operation in
                return UUFadeAnimator(operation: operation)
            }
        }
        set {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let textField:UITextField = {
           let v = UITextField()
            v.backgroundColor = UIColor.green
            v.text = "Keyword"
            v.uu_heroId = "search"
            return v
        }()
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            } else {
                make.top.equalTo(view.snp.top)
            }
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(44)
        }
        // Do any additional setup after loading the view.
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
