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
        label.text = "More Art to People"
        label.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
        return label
    }()
    
    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "사용자 이메일"
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        
        rxKeyHeight().observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (height) in
                if height == 0 {
                    
                } else {
                    guard let viewHeight = self?.view.frame.size.height else {
                        return
                    }
                    UIView.animate(withDuration: 0.5, animations: {
                        self?.titleLabelTopConstraint?.constant = viewHeight * 0.1
                        self?.view.layoutIfNeeded()
                    })
                }
            }).disposed(by: disposeBag)
    }
}

extension LoginViewController {
    func setup() {
        let components = [titleLabel, usernameTextField, passwordTextField, loginButton, registerButton]
        components.forEach { (component) in
            component.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(component)
        }
        
        titleLabelTopConstraint = NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: view.frame.size.height * 0.3)
        titleLabelTopConstraint?.isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true

        usernameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24).isActive = true
        usernameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        usernameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 24).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: usernameTextField.leftAnchor, constant: 0).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: usernameTextField.rightAnchor, constant: 0).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24).isActive = true
        loginButton.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor).isActive = true
        loginButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16).isActive = true
        registerButton.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor).isActive = true
        registerButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 32).isActive = true

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











