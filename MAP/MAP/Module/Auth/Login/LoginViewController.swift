//
//  LoginViewController.swift
//  MAP
//
//  Created by killi8n on 2018. 7. 18..
//  Copyright © 2018년 killi8n. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    var disposeBag: DisposeBag = DisposeBag()
    
    var titleLabelTopConstraint: NSLayoutConstraint?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "MAP"
        label.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
        return label
    }()
    
    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "사용자 아이디"
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "비밀번호"
        return tf
    }()
    
    let loginButton: UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.backgroundColor = UIColor.FlatColor.Blue.Blue6
        btn.setTitle("로그인", for: UIControlState.normal)
        btn.layer.cornerRadius = 8
        btn.setBackgroundColor(color: UIColor.FlatColor.Blue.Blue5, forState: UIControlState.highlighted, radius: 8)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.semibold)
        return btn
    }()
    
    let registerButton: UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.backgroundColor = UIColor.FlatColor.Gray.Gray6
        btn.setTitle("회원가입", for: UIControlState.normal)
        btn.layer.cornerRadius = 8
        btn.setBackgroundColor(color:  UIColor.FlatColor.Gray.Gray4, forState: UIControlState.highlighted, radius: 8)
        btn.addTarget(self, action: #selector(moveToRegister), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    let findPasswordButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("비밀번호 찾기", for: UIControlState.normal)
        return btn
    }()
    
    let findIdButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("아이디 찾기", for: UIControlState.normal)
        return btn
    }()
    
    lazy var findStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [findIdButton, findPasswordButton])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 16
        return sv
    }()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "MAP"
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("iPhone 5 or 5S or 5C")
                setupSmallest()
            case 1334:
                print("iPhone 6/6S/7/8")
            case 1920, 2208:
                print("iPhone 6+/6S+/7+/8+")
            case 2436:
                print("iPhone X")
            default:
                print("unknown")
            }
        }
        
//        setup()
        
//        rxKeyHeight().observeOn(MainScheduler.instance)
//            .subscribe(onNext: { [weak self] (height) in
//                if height == 0 {
//
//                } else {
//                    guard let viewHeight = self?.view.frame.size.height else {
//                        return
//                    }
//                    UIView.animate(withDuration: 0.5, animations: {
//                        self?.titleLabelTopConstraint?.constant = viewHeight * 0.1
//                        self?.view.layoutIfNeeded()
//                    })
//                }
//            }).disposed(by: disposeBag)
    }
}

extension LoginViewController {
    func setupSmallest() {
        let components = [usernameTextField, passwordTextField, loginButton, findIdButton, findPasswordButton]
        components.forEach { (component) in
            component.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(component)
        }
        
        usernameTextField.anchor(top: topLayoutGuide.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 24, left: 16, bottom: 0, right: 16))
        
        passwordTextField.anchor(top: usernameTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16))
        
        loginButton.anchor(top: passwordTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 24))
        
        
        findStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(findStackView)
        findStackView.anchor(top: loginButton.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 24))

    }
    
    func rxKeyHeight() -> Observable<CGFloat> {
        return Observable.from([
            NotificationCenter.default.rx.notification(Notification.Name.UIKeyboardWillShow)
                .map {
                    notification -> CGFloat in
                    (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.height ?? 0
            },
            NotificationCenter.default.rx.notification(Notification.Name.UIKeyboardWillHide)
                .map {
                    _ -> CGFloat in
                    0
            }
            ]).merge()
    }
    
    @objc func moveToRegister() {
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
}











