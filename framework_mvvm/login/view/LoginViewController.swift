//
//  LoginViewController.swift
//  framework_mvvm
//
//  Created by Derek on 2022/6/2.
//

import Foundation
import UIKit

/// ViewController层
/// 1，负责主体View的创建
/// 2，ViewModel的数据监听，通过databinding实现
/// 3，更新View
class LoginViewController: UIViewController {
    
    let viewModel = LoginViewModel()
    var loginView: LoginView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBind()
        
        self.view.backgroundColor = .white
        let loginView = LoginView(frame: self.view.bounds, viewModel: self.viewModel)
        self.view.addSubview(loginView)
        self.loginView = loginView
    }
    
    func setupBind() {
    
        self.viewModel.jsonString.bind {[weak self] value in
            let text: String = value! ?? "empty"
            self?.loginView?.update(text: text)
        }

    }
    
}
