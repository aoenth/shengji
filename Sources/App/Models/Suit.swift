//
//  File.swift
//  
//
//  Created by Kevin Peng on 2020-08-02.
//

import Foundation

enum Suit: Int, CustomStringConvertible {
    case spades, hearts, diamonds, clubs, leftBower, rightBower

    public var description: String {
        switch self {
        case .spades:
            return "Spades"
        case .hearts:
            return "Hearts"
        case .diamonds:
            return "Diamonds"
        case .clubs:
            return "Clubs"
        case .leftBower:
            return "Left Bower"
        case .rightBower:
            return "Right Bower"
        }
    }
}

extension Suit: Comparable {
    static func <(lhs: Suit, rhs: Suit) -> Bool {
        return lhs.faceValue < rhs.faceValue
    }

    var faceValue: Int {
        switch self {
        case .rightBower:
            return 6
        case .leftBower:
            return 5
        default:
            return 5 - self.rawValue
        }
    }
}
