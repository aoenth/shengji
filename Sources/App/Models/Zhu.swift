//
//  File.swift
//  
//
//  Created by Kevin Peng on 2020-08-02.
//

import Foundation

final class Zhu {
    private static var _suit: Suit?
    private static var _rank: Rank = .two

    static func shenji() {
        let currentLevel = _rank.rawValue
        if currentLevel == 13 {
            _rank = Rank(rawValue: 1)!
        } else if currentLevel == 1  {
            _rank = Rank(rawValue: 14)!
        } else if currentLevel == 14 {
            _rank = Rank(rawValue: 2)!
        } else {
            _rank = Rank(rawValue: currentLevel + 1)!
        }
    }

    static var rank: Rank {
        get {
            _rank
        }
        set {
            _rank = newValue
        }
    }

    static var suit: Suit? {
        get {
            _suit
        }
        set {
            if let value = newValue {
                if value == .leftBower || value == .rightBower {
                    _suit = nil
                } else {
                    _suit = value
                }
            }
        }
    }
}
