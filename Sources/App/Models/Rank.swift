//
//  File.swift
//  
//
//  Created by Kevin Peng on 2020-08-02.
//

import Foundation

enum Rank: Int, CaseIterable {
    case ace = 1, two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king, leftBower, rightBower
}

extension Rank: CustomStringConvertible {
    var description: String {
        switch self {
        case .ace:
            return "A"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        case .leftBower, .rightBower:
            return ""
        default:
            return "\(rawValue)"
        }
    }
}

extension Rank: Comparable {
    static func < (lhs: Rank, rhs: Rank) -> Bool {

        return lhs.faceValue < rhs.faceValue
    }

    var faceValue: Int {
        switch self {
        case .ace:
            return 14
        case .leftBower:
            return 15
        case .rightBower:
            return 16
        default:
            return self.rawValue
        }
    }
}
 

