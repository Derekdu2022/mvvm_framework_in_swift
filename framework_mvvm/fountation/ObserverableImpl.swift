//
//  ObserverableObject.swift
//  framework_mvvm
//
//  Created by Derek on 2022/6/2.
//

import Foundation
import UIKit


class ObservableImpl<T> : Observable {
    
    var value: T? {
        didSet{
            listener?(value)
        }
    }
    
    private var listener: ((T?) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    public func bind(listener: @escaping (T?) -> Void) {
        self.listener = listener
    }
    
}
