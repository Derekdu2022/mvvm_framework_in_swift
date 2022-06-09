//
//  LoginService.swift
//  framework_mvvm
//
//  Created by Derek on 2022/6/2.
//

import Foundation

/// Service层接口
/// 1，提供业务服务接口供ViewModel使用
/// 2，本层具体实现都是定制话的业务，业务无关逻辑再下方一层
protocol LoginService {

    func login(
        requestBody body: LoginRequestBody,
        callbckQueue queue: CallbackQueue,
        completionHandler completion: @escaping (Result<LoginResponse, DXError>) -> Void)

}
