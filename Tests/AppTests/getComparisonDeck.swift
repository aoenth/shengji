//
//  getComparisonDeck.swift
//  AppTests
//
//  Created by Serena Ma on 2020-08-02.
//

import XCTest
@testable import App
class getComparisonDeck: XCTestCase {
    func test1() {
        Zhu.suit = Suit.diamonds
        Zhu.rank = Rank.five
//        let dict = Card.comparisonDeck
//        Card.printDictionary(dict)
        let a = Hand(cards: [
            Card(suit: Suit.hearts, rank: Rank.two, deckNumber:1),
            Card(suit: Suit.hearts, rank: Rank.two, deckNumber:2),
            Card(suit: Suit.hearts, rank: Rank.three, deckNumber:1),
            Card(suit: Suit.hearts, rank: Rank.three, deckNumber:2),
            Card(suit: Suit.hearts, rank: Rank.four, deckNumber:1)]
            )
        print(a.analyzeHand())
        
    }
    
    func test2() {
        print(Card(id:8))
    }
}
