//
//  ViewController.swift
//  Example
//
//  Created by neutronstarer on 2020/8/25.
//  Copyright © 2020 neutronstarer. All rights reserved.
//

import UIKit
import UUNavigationController
import SnapKit

class Cell: UITableViewCell {
    
    var label: UILabel = {()->UILabel in
        let v = UILabel()
        v.font = UIFont.systemFont(ofSize: 18)
        v.textColor = UIColor.white
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.backgroundColor = UIColor.init(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1)
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14))
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentView.addSubview(label)
        contentView.backgroundColor = UIColor.init(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1)
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14))
        }
    }
}

class CellModel: NSObject {
    var title: String?
    var action: (()->())?
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate {
   
    lazy var tableView = {()->UITableView in
        let v = UITableView(frame: .zero, style: .plain)
        v.register(Cell.self, forCellReuseIdentifier: "Cell")
        v.delegate = self
        v.dataSource = self
        v.rowHeight = 44
        v.tableFooterView = UIView()
        v.tableHeaderView = {()->UIView in
           let v = UITextField()
            v.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 44)
            v.backgroundColor = UIColor.green
            v.text = "Search"
            v.delegate = self
            v.uu_heroId = "search"
            return v
        }()
        return v
    }()
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        navigationController?.pushViewController(SearchViewController(), animated: true)
        return false
    }
    
    lazy var animationView = {()->UIView in
        let v = UIView()
        v.backgroundColor = UIColor.red
        let animation = CABasicAnimation.init(keyPath: "transform.rotation.z")
        animation.repeatCount = Float.greatestFiniteMagnitude
        animation.duration = 1
        animation.byValue = Double.pi*2
        animation.isCumulative = true
        animation.isAdditive = true
        animation.isRemovedOnCompletion = false
        v.layer.add(animation, forKey: "transform.rotation.z")
        return v
    }()

    var cellModels : [CellModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.title == "0" {
            self.navigationController?.isNavigationBarHidden = true
        }else{
            self.navigationController?.isNavigationBarHidden = false
        }
        NSLog("\(self) \(title ?? "") viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NSLog("\(self) \(title ?? "") viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NSLog("\(self) \(title ?? "") viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NSLog("\(self) \(title ?? "") viewDidDisappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if title == nil || title?.count == 0 {
           title = "0"
        }
        view.backgroundColor = UIColor.white
        view.addSubview(animationView)
        view.addSubview(tableView)
        animationView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset((sqrt(pow(50, 2)+pow(50, 2))-50)/2.0)
            } else {
                // Fallback on earlier versions
                make.top.equalTo(view.snp.top).offset((sqrt(pow(50, 2)+pow(50, 2))-50)/2.0)
            }
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        tableView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(sqrt(pow(50, 2)+pow(50, 2)))
            } else {
                // Fallback on earlier versions
                make.top.equalTo(view.snp.top).offset(sqrt(pow(50, 2)+pow(50, 2)))
            }
        }
        
        cellModels.append({()->CellModel in
            let v = CellModel()
            v.title = "pop"
            v.action = {[weak self] ()->() in
                self?.navigationController?.popViewController(animated: true)
            }
            return v
        }())
        cellModels.append({()->CellModel in
            let v = CellModel()
            v.title = "pop:root"
            v.action = {[weak self] ()->() in
                self?.navigationController?.popToRootViewController(animated: true)
            }
            return v
        }())
        cellModels.append({()->CellModel in
            let v = CellModel()
            v.title = "push:fade+"
            v.action = {[weak self] ()->() in
                self?.navigationController?.pushViewController({[weak self]()->ViewController in
                    let v = ViewController()
                    v.title = self?.nextTitle(seq: 1)
                    v.animatorMaker = {operation in
                        return UUFadeAnimator(operation: operation)
                    }
                    return v
                }(), animated: true)
            }
            return v
        }())
        cellModels.append({()->CellModel in
            let v = CellModel()
            v.title = "push:push+"
            v.action = {[weak self] ()->() in
                self?.navigationController?.pushViewController({[weak self]()->ViewController in
                    let v = ViewController()
                    v.title = self?.nextTitle(seq: 1)
                    return v
                }(), animated: true)
            }
            return v
        }())
        cellModels.append({()->CellModel in
            let v = CellModel()
            v.title = "push:present+"
            v.action = {[weak self] ()->() in
                self?.navigationController?.pushViewController({[weak self]()->ViewController in
                    let v = ViewController()
                    v.animatorMaker = {operation in
                        return UUPresentAnimator(operation: operation)
                    }
                    v.title = self?.nextTitle(seq: 1)
                    return v
                }(), animated: true)
            }
            return v
        }())
        cellModels.append({()->CellModel in
            let v = CellModel()
            v.title = "push:curtain+"
            v.action = {[weak self] ()->() in
                self?.navigationController?.pushViewController({[weak self]()->ViewController in
                    let v = ViewController()
                    v.animatorMaker = {operation in
                        return UUCurtainAnimator(operation: operation)
                    }
                    v.title = self?.nextTitle(seq: 1)
                    return v
                }(), animated: true)
            }
            return v
        }())
        cellModels.append({()->CellModel in
            let v = CellModel()
            v.title = "set:curtain+"
            v.action = {[weak self] ()->() in
                self?.navigationController?.setViewControllers([{()->ViewController in
                    let v = ViewController()
                    v.animatorMaker = {operation in
                        return UUCurtainAnimator(operation: operation)
                    }
                    v.title = "0"
                    return v
                }()], animated: true)
            }
            return v
        }())
        cellModels.append({()->CellModel in
            let v = CellModel()
            v.title = "push:push+/present+"
            v.action = {[weak self] ()->() in
                self?.uu_navigationController?.pushViewControllers([{[weak self]()->ViewController in
                    let v = ViewController()
                    v.title = self?.nextTitle(seq: 1)
                    return v
                }(),{[weak self]()->ViewController in
                    let v = ViewController()
                    v.title = self?.nextTitle(seq: 2)
                    v.animatorMaker = {operation in
                        return UUPresentAnimator(operation: operation)
                    }
                    return v
                }()], animated: true)
            }
            return v
        }())
        
        cellModels.append({()->CellModel in
            let v = CellModel()
            v.title = "push:alert+"
            v.action = {[weak self] ()->() in
                self?.navigationController?.pushViewController({()->AlertViewController in
                    let v = AlertViewController()
                    return v
                }(), animated: true)
            }
            return v
        }())
        
        cellModels.append({()->CellModel in
            let v = CellModel()
            v.title = "push:action sheet+"
            v.action = {[weak self] ()->() in
                self?.navigationController?.pushViewController({()->ActionSheetViewController in
                    let v = ActionSheetViewController()
                    return v
                }(), animated: true)
            }
            return v
        }())
 
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func nextTitle(seq: Int) -> String {
        return String((Int(self.uu_navigationController?.viewControllers.last?.title ?? "0") ?? 0) + seq, radix: 10)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        cell.label.text = cellModels[indexPath.row].title
        return cell
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        cellModels[indexPath.row].action!()
    }
    
}
