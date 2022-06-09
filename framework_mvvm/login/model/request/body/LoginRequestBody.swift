//
//  LoginBody.swift
//  framework_mvvm
//
//  Created by Derek on 2022/6/8.
//

import Foundation

public struct LoginRequestBody: Convertable {
    public let email: String
    public let password: String
}
