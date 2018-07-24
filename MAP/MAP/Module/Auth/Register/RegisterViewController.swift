//
//  RegisterViewController.swift
//  MAP
//
//  Created by killi8n on 2018. 7. 18..
//  Copyright © 2018년 killi8n. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {
    
    var disposeBag: DisposeBag = DisposeBag()
    
    var titleLabelTopConstraint: NSLayoutConstraint?
    
    var emailTextFieldTopConstraint: NSLayoutConstraint?
    
    var keyboardShowed: Bool = false
    
    lazy var keyboardDownGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(keyboardDown))
        return gesture
    }()
    
    let rightBarButton: UIBarButtonItem = {
        let btn = UIBarButtonItem(title: "약관", style: UIBarButtonItemStyle.done, target: self, action: nil)
        return btn
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "MAP"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
        return label
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "사용자 이메일"
        return tf
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "성명"
        return tf
    }()
    
    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "아이디"
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "패스워드"
        return tf
    }()
    
    let registerButton: UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.backgroundColor = UIColor.FlatColor.Gray.Gray6
        btn.setTitle("회원가입", for: UIControlState.normal)
        btn.layer.cornerRadius = 8
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        btn.setBackgroundColor(color:  UIColor.FlatColor.Gray.Gray4, forState: UIControlState.highlighted, radius: 8)
        return btn
    }()
    
    let mapLoginButton: UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.backgroundColor = UIColor.FlatColor.Gray.Gray6
        btn.setTitle("MAP", for: UIControlState.normal)
        btn.layer.cornerRadius = 8
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        btn.setBackgroundColor(color:  UIColor.FlatColor.Gray.Gray4, forState: UIControlState.highlighted, radius: 8)
        return btn
    }()
    
    let facebookLoginButton: UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.backgroundColor = UIColor.FlatColor.Blue.Blue8
        btn.setTitle("페이스북", for: UIControlState.normal)
        btn.layer.cornerRadius = 8
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        btn.setBackgroundColor(color:  UIColor.FlatColor.Gray.Gray4, forState: UIControlState.highlighted, radius: 8)
        
        return btn
    }()

    let naverLoginButton: UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.backgroundColor = UIColor.FlatColor.Green.Green8
        btn.setTitle("네이버", for: UIControlState.normal)
        btn.layer.cornerRadius = 8
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        btn.setBackgroundColor(color:  UIColor.FlatColor.Gray.Gray4, forState: UIControlState.highlighted, radius: 8)
        return btn
    }()
    
    lazy var buttonStackView: UIStackView = {
        
        let sv = UIStackView(arrangedSubviews: [mapLoginButton, facebookLoginButton, naverLoginButton])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 4
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
        
        view.addGestureRecognizer(keyboardDownGesture)
        
        self.emailTextFieldTopConstraint = NSLayoutConstraint(item: emailTextField, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: topLayoutGuide, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: view.frame.size.height * 0.25)
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("iPhone 5 or 5S or 5C")
                setupSmallest()
            case 1334:
                print("iPhone 6/6S/7/8")
                setupNormalPhone()
                rxKeyHeight().observeOn(MainScheduler.instance)
                    .subscribe({ [weak self] (height) in
                        guard let height = height.element else {
                            return
                        }
                        guard let keyboardShowed = self?.keyboardShowed else {return}
                        if keyboardShowed {
                            return
                        }
                        
                        if height == 0 {
                            UIView.animate(withDuration: 0.5, animations: {
                                self?.emailTextFieldTopConstraint?.constant = (self?.view.frame.size.height)! * 0.25
                                
                                self?.view.layoutIfNeeded()
                            })
                        } else {
                            guard let viewHeight = self?.view.frame.size.height else {
                                return
                            }
                            UIView.animate(withDuration: 0.5, animations: {
                                self?.emailTextFieldTopConstraint?.constant = viewHeight * 0.1
                                self?.view.layoutIfNeeded()
                            })
                        }
                    }).disposed(by: disposeBag)
            case 1920, 2208:
                print("iPhone 6+/6S+/7+/8+")
                setupNormalPhone()
                rxKeyHeight().observeOn(MainScheduler.instance)
                    .subscribe({ [weak self] (height) in
                        guard let height = height.element else {
                            return
                        }
                        guard let keyboardShowed = self?.keyboardShowed else {return}
                        if keyboardShowed {
                            return
                        }
                        
                        if height == 0 {
                            UIView.animate(withDuration: 0.5, animations: {
                                self?.emailTextFieldTopConstraint?.constant = (self?.view.frame.size.height)! * 0.25
                                
                                self?.view.layoutIfNeeded()
                            })
                        } else {
                            guard let viewHeight = self?.view.frame.size.height else {
                                return
                            }
                            UIView.animate(withDuration: 0.5, animations: {
                                self?.emailTextFieldTopConstraint?.constant = viewHeight * 0.1
                                self?.view.layoutIfNeeded()
                            })
                        }
                    }).disposed(by: disposeBag)
            case 2436:
                print("iPhone X")
            default:
                print("unknown")
            }
        }
        
        
        
        
//        setup()
        bind()
        
    }

}

extension RegisterViewController {
    
    
    func setupSmallest() {
        self.navigationItem.rightBarButtonItem = self.rightBarButton
        let components = [emailTextField, nameTextField, usernameTextField, passwordTextField, registerButton]
        components.forEach { (component) in
            component.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(component)
        }


        
        emailTextField.anchor(top: topLayoutGuide.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
//
        nameTextField.anchor(top: emailTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16))
        
        usernameTextField.anchor(top: nameTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16))
        
        passwordTextField.anchor(top: usernameTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16))
        
        registerButton.anchor(top: passwordTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 24))
        
        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.anchor(top: registerButton.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 24))
    }
    
    func setupNormalPhone() {
        self.navigationItem.rightBarButtonItem = self.rightBarButton
        
        let components = [emailTextField, nameTextField, usernameTextField, passwordTextField, registerButton]
        components.forEach { (component) in
            component.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(component)
        }
        
        
        self.emailTextFieldTopConstraint?.isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        
        
//        emailTextField.anchor(top: topLayoutGuide.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: view.frame.size.height * 0.25, left: 16, bottom: 0, right: 16))
        
        nameTextField.anchor(top: emailTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        
        usernameTextField.anchor(top: nameTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        
        passwordTextField.anchor(top: usernameTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        
        registerButton.anchor(top: passwordTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 32))
        
        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.anchor(top: registerButton.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 32))
        
    }
    
    @objc func keyboardDown() {
        guard let emailTextFieldTopConstraint = self.emailTextFieldTopConstraint else {
            return
        }
        self.view.endEditing(true)
        UIView.animate(withDuration: 0.5, animations: {
            
            emailTextFieldTopConstraint.constant = self.view.frame.size.height * 0.25
            self.view.layoutIfNeeded()
            self.keyboardShowed = false
        })
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
    
    func bind() {
        mapLoginButton.rx.tap.asObservable().subscribe(onNext: { [weak self] _ in
            self?.navigationController?.pushViewController(LoginViewController(), animated: true)
        }).disposed(by: disposeBag)
    }
}


