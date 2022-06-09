//
//  LoginView.swift
//  framework_mvvm
//
//  Created by Derek on 2022/6/2.
//

import Foundation
import UIKit

/// 主体View层
/// 1，拥有ViewModel的引用
/// 2，管理自己和所有子View
/// 3，提供View更新接口给ViewController调用
class LoginView: UIView {
    
    var viewModel: LoginViewModel?
    
    
    var label: UILabel = UILabel()
    var loginButton: UIButton = UIButton(type: .custom)
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(frame: CGRect, viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        setup()
    }

    func setup() {
        label.frame = CGRect(x: 10, y: 50, width: 300, height: 50)
        label.textAlignment = .center
        label.textColor = .red
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 16)
        label.text = "Clik button to login!!!"
        addSubview(label)
        
        loginButton.frame = CGRect(x: 50, y: 150, width: 200, height: 50)
        loginButton.setTitle("登录测试", for: UIControl.State.normal)
        loginButton.setTitleColor(.blue, for: UIControl.State.normal)
        addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(loginButtonClick(button:)), for: UIControl.Event.touchUpInside)
    
    }
    
    @objc func loginButtonClick(button: UIButton) {
        self.viewModel?.login(email: "derekdu2022@gmail.com", password: "password")
    }
    
    func update(text: String) {
        self.label.text = text
    }
}
