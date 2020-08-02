//
//  File.swift
//  
//
//  Created by Kevin Peng on 2020-08-02.
//

import Foundation

extension Card: Comparable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        if Zhu.suit == nil {
            return lhs.rank < rhs.rank
        }
        
        switch (lhs.suit, rhs.suit) {
        case (.rightBower, _):
            return false
        case (.leftBower, _):
            return rhs.suit == .rightBower
        case (_, .rightBower):
            return true
        case (_, .leftBower):
            return lhs.suit != .rightBower
        default:
            break
        }
        
        if lhs.rank == Zhu.rank && rhs.rank == Zhu.rank {
            if lhs.suit == Zhu.suit && rhs.suit == Zhu.suit {
                return false
            } else if lhs.suit == Zhu.suit {
                return false
            } else if rhs.suit == Zhu.suit {
                return true
            }
        }
        
        if lhs.suit == Zhu.suit && rhs.suit == Zhu.suit {
            return lhs.rank < rhs.rank
        }
        
        if lhs.suit == Zhu.suit {
            return false
        }
        
        if rhs.suit == Zhu.suit {
            return true
        }
        
        return lhs.rank < rhs.rank
    }
}
