//
//  Convertable.swift
//  framework_mvvm
//
//  Created by Derek on 2022/6/8.
//

import Foundation

/// 直接将Struct或Class转成Dictionary
protocol Convertable: Codable {

}

extension Convertable {
    
    func convertToDictionary() -> Dictionary<String, Any>? {
        var dict: Dictionary<String, Any>? = nil
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any>
        } catch {
            print(error)
        }
        return dict
    }
    
}
