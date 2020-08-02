//
//  File.swift
//  
//
//  Created by Kevin Peng on 2020-08-02.
//

import Foundation

final class Zhu {
    private static var _value: Suit?
    private static var _level: Rank = .two

    static func shenji() {
        let currentLevel = _level.rawValue
        if currentLevel == 13 {
            _level = Rank(rawValue: 1)!
        } else if currentLevel == 1  {
            _level = Rank(rawValue: 14)!
        } else if currentLevel == 14 {
            _level = Rank(rawValue: 2)!
        } else {
            _level = Rank(rawValue: currentLevel + 1)!
        }
    }

    static var level: Rank {
        get {
            _level
        }
        set {
            _level = newValue
        }
    }

    static var suit: Suit? {
        get {
            _value
        }
        set {
            if let value = newValue {
                if value == .leftBower || value == .rightBower {
                    _value = nil
                } else {
                    _value = value
                }
            }
        }
    }
}
