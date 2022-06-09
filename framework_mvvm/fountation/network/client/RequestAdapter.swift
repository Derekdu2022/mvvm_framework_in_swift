//
//  RequestAdapter.swift
//  framework_mvvm
//
//  Created by Derek on 2022/6/6.
//

import Foundation
import UIKit

/// Adapts a request to another request. Adapters modify an input `URLRequest` object.
public protocol RequestAdapter {
    
    /// Adapts an input `URLRequest` object and returns a modified object.
    ///
    /// - Parameter request: The request to be adapted.
    /// - Returns: The modified `URLRequest` object.
    /// - Throws: An error during the adapting process.
    func adapted(_ request: URLRequest) throws -> URLRequest
}

struct TokenAdapter: RequestAdapter {
    let token: String?
    init(token: String?) {
        self.token = token
    }
    
    func adapted(_ request: URLRequest) throws -> URLRequest {
        guard let token = token else {
            throw DXError.lackOfAccessToken //LineSDKError.requestFailed(reason: .lackOfAccessToken)
        }
        var request = request
        request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        return request
    }
}

struct HeaderAdapter: RequestAdapter {
    static let `default` = HeaderAdapter()
    
    let userAgent: String
    
    init(in info: [String: Any]? = nil) {
        
        let info = info ?? Bundle.main.infoDictionary ?? [:]
        
        let appID = info["CFBundleIdentifier"] as? String ?? ""
        let appVersion = info["CFBundleShortVersionString"] as? String ?? ""
        
        let device = UIDevice.current
        let systemVersion = device.systemVersion.replacingOccurrences(of: ".", with: "_")
        let model = device.model
        
        userAgent = "\(appID)/\(appVersion) " +
                    "(\(model); CPU iPhone OS \(systemVersion) like Mac OS X)"
    }
    
    func adapted(_ request: URLRequest) throws -> URLRequest {
        var request = request
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("private, no-store, no-cache, must-revalidate", forHTTPHeaderField: "Cache-Control")
        request.setValue(userAgent, forHTTPHeaderField: "User-Agent")
        
        return request
    }
}

/// Provides an easy way to create a `RequestAdapter` object with a block.
public struct AnyRequestAdapter: RequestAdapter {

    var block: (URLRequest) throws -> URLRequest
    
    /// Initializes an `AnyRequestAdapter` object with a closure.
    ///
    /// - Parameter block: A closure to be invoked with an input `URLRequest` object.
    public init(_ block: @escaping (URLRequest) throws -> URLRequest) {
        self.block = block
    }
    
    /// Adapts an input `URLRequest` object and returns a modified object.
    ///
    /// - Parameter request: The request to be adapted.
    /// - Returns: The modified `URLRequest` object.
    /// - Throws: An error during the adapting process.
    /// - Note: This method just invokes `block` received from the initializer.
    public func adapted(_ request: URLRequest) throws -> URLRequest {
        return try block(request)
    }
}
