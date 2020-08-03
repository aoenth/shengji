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
 

