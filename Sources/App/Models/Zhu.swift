//
//  File.swift
//  
//
//  Created by Kevin Peng on 2020-08-02.
//

import Foundation

final class Zhu {
    private static var _value: Suit?

    static var value: Suit? {
        get {
            _value
        }
        set {
            if let value = newValue {
                if value == .leftBower || value == .rightBower {
                    _value = nil
                }
            }
        }
    }
}
