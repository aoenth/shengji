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
        if Zhu.rank != Rank.leftBower && Zhu.rank != Rank.rightBower {
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
        
        if zhuSuit == nil {
            for rank in rankOrder {
                if rank != Zhu.rank.rawValue{
                    guard let rank = Rank(rawValue: rank) else {
                        return comparisonDeck
                    }
                    for suit in [Suit.spades, .hearts, .diamonds, .clubs]{
                        comparisonDeck[Card(suit: suit, rank: rank, deckNumber: 1)] = baseComparisonCounter
                        comparisonDeck[Card(suit: suit, rank: rank, deckNumber: 2)] = baseComparisonCounter
                    }
                baseComparisonCounter += 1
                }
            }
        }
        else{
            for rank in rankOrder {
                guard let rank = Rank(rawValue: rank) else {
                    return comparisonDeck
                }
                guard let zhuSuit = Zhu.suit else{
                    return comparisonDeck
                }
                if rank != Zhu.rank {
                    comparisonDeck[Card(suit: zhuSuit, rank: rank, deckNumber: 1)] = baseComparisonCounter
                    comparisonDeck[Card(suit: zhuSuit, rank: rank, deckNumber: 2)] = baseComparisonCounter
                    baseComparisonCounter += 1
                }
            }
            for rank in rankOrder {
                guard let rank = Rank(rawValue: rank) else {
                    return comparisonDeck
                }
                for suit in [Suit.spades, .hearts, .diamonds, .clubs]{
                    if suit != zhuSuit && rank != Zhu.rank {
                        comparisonDeck[Card(suit: suit, rank: rank, deckNumber: 1)] = baseComparisonCounter
                        comparisonDeck[Card(suit: suit, rank: rank, deckNumber: 2)] = baseComparisonCounter
                    }
                }
                baseComparisonCounter += 1

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
