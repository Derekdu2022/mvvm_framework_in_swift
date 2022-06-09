//
//  LoginResponse.swift
//  framework_mvvm
//
//  Created by Derek on 2022/6/7.
//

import Foundation

public struct LoginResponse: Codable {
    public let code: Int
    public let msg: String
    public let result: LoginResult
}
