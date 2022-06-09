//
//  LoginViewModel.swift
//  framework_mvvm
//
//  Created by Derek on 2022/6/2.
//

import Foundation

/// ViewModel层
/// 1，管理View所使用的数据，通过ObservableObject泛型实现DataBinding
/// 2，提供业务接口给View调用
/// 3，ViewModel通常调用Service层接口
class LoginViewModel {
    
    var jsonString: ObservableObject<String?> = ObservableObject(nil)

    func login(email: String, password: String) -> Void {
        let loginService = LoginServiceImpl()

        let opQueue = OperationQueue()
        opQueue.name = "LoginViewModel.login"
        opQueue.maxConcurrentOperationCount = 3
        
        let requestBody = LoginRequestBody(email: email, password: password)
        loginService.login(requestBody: requestBody,
                           callbckQueue: CallbackQueue.operation(opQueue)) {[weak self] result in
            switch result {
            case .success(let response):
                CallbackQueue.asyncMain.execute {
                    self?.jsonString.value = "用户\(response.result.email)登录成功！"
                }
            case .failure(_):
                CallbackQueue.asyncMain.execute {
                    self?.jsonString.value = "用户登录失败！"
                }
            }
        }
    }
    
}

