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
        Card.comparisonDeck
        
    }
}
