//
//  File.swift
//  
//
//  Created by Kevin Peng on 2020-08-02.
//

import Foundation

extension Card {
    static func printDictionary(_ dictionary: [Card: Int]) {
        let sortedKeyValue = dictionary.sorted {
            $0.value < $1.value
        }
        print(String(repeating: "\n", count: 5))
        for (key, value) in sortedKeyValue {
            let numberOfSpacesForNumber = 3 - String(value).count
            let spacesForNumbers = String(repeating: " ", count: numberOfSpacesForNumber)
            print("\(spacesForNumbers)\(value): \(key)")
        }
        print(String(repeating: "\n", count: 5))
    }
    static var comparisonDeck: [Card: Int] {
        let zhuSuit = Zhu.suit
        let rankOrder = [1,13,12,11,10,9,8,7,6,5,4,3,2]
        var comparisonDeck =
            [Card(id: 114) : 1,
             Card(id: 115) : 1,
             Card(id: 112) : 2,
             Card(id: 113) : 2]
        var baseComparisonCounter = 3
        if zhuSuit != Suit.leftBower && zhuSuit != Suit.rightBower {
            if let zhuSuit = zhuSuit {
                comparisonDeck[Card(suit: zhuSuit, rank: Zhu.rank, deckNumber: 1)] = baseComparisonCounter
                comparisonDeck[Card(suit: zhuSuit, rank: Zhu.rank, deckNumber: 2)] = baseComparisonCounter
                baseComparisonCounter += 1
            }
            for suit in [Suit.spades, .hearts, .diamonds, .clubs]{
                if suit != zhuSuit {
                    comparisonDeck[Card(suit: suit, rank: Zhu.rank, deckNumber: 1)] = baseComparisonCounter
                    comparisonDeck[Card(suit: suit, rank: Zhu.rank, deckNumber: 2)] = baseComparisonCounter
                }
            }
            baseComparisonCounter += 1
        }
        
        if zhuSuit == Suit.leftBower || zhuSuit == Suit.rightBower || zhuSuit == nil {
            for rank in rankOrder {
                guard let rank = Rank(rawValue: rank) else {
                    return comparisonDeck
                }
                guard let rankIncrease = rankOrder.firstIndex(of: rank.rawValue) else{
                    return comparisonDeck
                }
                for suit in [Suit.spades, .hearts, .diamonds, .clubs]{
                    comparisonDeck[Card(suit: suit, rank: rank, deckNumber: 1)] = baseComparisonCounter + rankIncrease
                    comparisonDeck[Card(suit: suit, rank: rank, deckNumber: 2)] = baseComparisonCounter + rankIncrease
                }
            }
        }
        else{
            for rank in rankOrder {
                guard let rank = Rank(rawValue: rank) else {
                    return comparisonDeck
                }
                guard let rankIncrease = rankOrder.firstIndex(of: rank.rawValue) else{
                    return comparisonDeck
                }
                guard let zhuSuit = Zhu.suit else{
                    return comparisonDeck
                }
                if rank != Zhu.rank {
                    comparisonDeck[Card(suit: zhuSuit, rank: rank, deckNumber: 1)] = 5 + rankIncrease
                    comparisonDeck[Card(suit: zhuSuit, rank: rank, deckNumber: 2)] = 5 + rankIncrease
                }
            }
            for rank in rankOrder {
                guard let rank = Rank(rawValue: rank) else {
                    return comparisonDeck
                }
                guard let rankIncrease = rankOrder.firstIndex(of: rank.rawValue) else{
                    return comparisonDeck
                }
                for suit in [Suit.spades, .hearts, .diamonds, .clubs]{
                    if suit != zhuSuit && rank != Zhu.rank {
                        comparisonDeck[Card(suit: suit, rank: rank, deckNumber: 1)] = 17 + rankIncrease
                        comparisonDeck[Card(suit: suit, rank: rank, deckNumber: 2)] = 17 + rankIncrease
                    }
                }

            }
        }
        print("Dictionary")
        printDictionary(comparisonDeck)
        return comparisonDeck
    }
    
}

extension Card {
    func isEqual(to card: Card) -> Bool {
        return Card.comparisonDeck[self] == Card.comparisonDeck[card]
    }
}

extension Card: Comparable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        return comparisonDeck[lhs]! > comparisonDeck[rhs]!
    }
}
    //    static func < (lhs: Card, rhs: Card) -> Bool {
    //        if zhuSuit == nil {
    //            return lhs.rank < rhs.rank
    //        }
    //
    //        switch (lhs.suit, rhs.suit) {
    //        case (.rightBower, _):
    //            return false
    //        case (.leftBower, _):
    //            return rhs.suit == .rightBower
    //        case (_, .rightBower):
    //            return true
    //        case (_, .leftBower):
    //            return lhs.suit != .rightBower
    //        default:
    //            break
    //        }
    //
    //        if lhs.rank == Zhu.rank && rhs.rank == Zhu.rank {
    //            if lhs.suit == zhuSuit && rhs.suit == zhuSuit {
    //                return false
    //            } else if lhs.suit == zhuSuit {
    //                return false
    //            } else if rhs.suit == zhuSuit {
    //                return true
    //            }
    //        }
    //
    //        if lhs.suit == zhuSuit && rhs.suit == zhuSuit {
    //            return lhs.rank < rhs.rank
    //        }
    //
    //        if lhs.suit == zhuSuit {
    //            return false
    //        }
    //
    //        if rhs.suit == zhuSuit {
    //            return true
    //        }
    //
    //        return lhs.rank < rhs.rank
    //    }
