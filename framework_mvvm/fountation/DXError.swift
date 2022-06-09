//
//  DXError.swift
//  framework_mvvm
//
//  Created by Derek on 2022/6/6.
//

import Foundation

public enum DXError: Error {
    
    case none
    
    case lackOfAccessToken
    case missingURL
    case jsonEncodingFailed
    case unknownError
    
    case responseFailed
    case dataParsingFailed
    
    
}
