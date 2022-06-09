//
//  LoginRequest.swift
//  framework_mvvm
//
//  Created by Derek on 2022/6/6.
//

import Foundation

public struct LoginRequest: Request {
    public typealias Response = LoginResponse
    
    public let method: HTTPMethod = .get

    public let path: String = "/mock/12/date-web-api/api/remote/getNtoken"
    
    public var authentication: AuthenticateMethod = .token
        
    public var body: LoginRequestBody?
    
    public var parameters: Parameters? {
        let dict = body?.convertToDictionary()
        return dict
    }
    
    private init() {}
    
    init(requestBody body: LoginRequestBody) {
        self.body = body
    }
    
}
