//
//  LoginResult.swift
//  framework_mvvm
//
//  Created by Derek on 2022/6/8.
//

import Foundation

public struct LoginResult: Codable {
    public let userID: String
    public let displayName: String
    public let email: String
    public let pictureURL: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case displayName
        case email
        case pictureURL = "pictureUrl"
    }
}

public typealias UserProfile = LoginResult
