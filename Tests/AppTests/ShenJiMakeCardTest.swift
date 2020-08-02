//
//  ShenJiMakeCardTest.swift
//  AppTests
//
//  Created by Kevin Peng on 2020-08-02.
//

import XCTest
@testable import App

class ShenJiMakeCardTest: XCTestCase {

    func testAceOfSpades() {
        let card = Card(id: 8)
        let expectation = Card(suit: .spades, rank: .ace, deckNumber: 1)
        XCTAssertEqual(card, expectation)
    }
    
    func testAceOfSpadesDeck2() {
        let card = Card(id: 12)
        let expectation = Card(suit: .spades, rank: .ace, deckNumber: 2)
        XCTAssertEqual(card, expectation)
    }
    
    func testKingOfHearts() {
        let card = Card(id: 105)
        let expectation = Card(suit: .hearts, rank: .king, deckNumber: 1)
        XCTAssertEqual(card, expectation)
    }
    
    func testKingOfHeartsDeck2() {
        let card = Card(id: 109)
        let expectation = Card(suit: .hearts, rank: .king, deckNumber: 2)
        XCTAssertEqual(card, expectation)
    }
    
    func test6OfDiamonds() {
        let card = Card(id: 50)
        let expectation = Card(suit: .diamonds, rank: .six, deckNumber: 1)
        XCTAssertEqual(card, expectation)
    }
    
    func testLeftBower() {
        let card = Card(id: 112)
        let expectation = Card(suit: .leftBower, rank: .leftBower, deckNumber: 1)
        XCTAssertEqual(card, expectation)
    }
    
    func testLeftBowerDeck2() {
        let card = Card(id: 113)
        let expectation = Card(suit: .leftBower, rank: .leftBower, deckNumber: 2)
        XCTAssertEqual(card, expectation)
    }
    
    func testRightBower() {
        let card = Card(id: 114)
        let expectation = Card(suit: .rightBower, rank: .rightBower, deckNumber: 1)
        XCTAssertEqual(card, expectation)
    }
    
    func testRightBowerDeck2() {
        let card = Card(id: 115)
        let expectation = Card(suit: .rightBower, rank: .rightBower, deckNumber: 2)
        XCTAssertEqual(card, expectation)
    }
}
