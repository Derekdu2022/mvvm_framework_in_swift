//
//  LoginServiceImpl.swift
//  framework_mvvm
//
//  Created by Derek on 2022/6/2.
//

import Foundation

/// Service实现层
/// 1，实现业务服务接口供ViewModel使用
class LoginServiceImpl: LoginService {
  
    func login(
        requestBody body: LoginRequestBody,
        callbckQueue queue: CallbackQueue,
        completionHandler completion: @escaping (Result<LoginResponse, DXError>) -> Void) {
            var request = LoginRequest(requestBody: body)

#if false //TODO derek TEST
            Session.shared.send(request, callbackQueue: queue, completionHandler: completion)
#else
            Session.shared.send(request, callbackQueue: queue) { result in
                let loginResult = LoginResult(userID: "111",
                                              displayName: "Derek",
                                              email: "derekdu2022@gmail.com",
                                              pictureURL: "u")
                let response = LoginResponse(code: 200, msg: "success", result: loginResult)
                let fakeResult = Result<LoginResponse, DXError>.success(response)
                completion(fakeResult)
            }
#endif
            
    }
}
