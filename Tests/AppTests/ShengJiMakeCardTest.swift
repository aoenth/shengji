//
//  ShengJiMakeCardTest.swift
//  AppTests
//
//  Created by Kevin Peng on 2020-08-02.
//

import XCTest
@testable import App

class ShengJiMakeCardTest: XCTestCase {

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
    
    func testAceOfSpadesID() {
        let card = Card(id: 8)
        XCTAssertEqual(card.cardID, 8)
    }
    
    func testAceOfSpadesDeck2ID() {
        let card = Card(id: 12)
        XCTAssertEqual(card.cardID, 12)
    }
    
    func testKingOfHeartsID() {
        let card = Card(id: 105)
        XCTAssertEqual(card.cardID, 105)
    }
    
    func testKingOfHeartsDeck2ID() {
        let card = Card(id: 109)
        XCTAssertEqual(card.cardID, 109)
    }
    
    func test6OfDiamondsID() {
        let card = Card(id: 50)
        XCTAssertEqual(card.cardID, 50)
    }
    
    func testLeftBowerID() {
        let card = Card(id: 112)
        XCTAssertEqual(card.cardID, 112)
    }
    
    func testLeftBowerDeck2ID() {
        let card = Card(id: 113)
        XCTAssertEqual(card.cardID, 113)
    }
    
    func testRightBowerID() {
        let card = Card(id: 114)
        XCTAssertEqual(card.cardID, 114)
    }
    
    func testRightBowerDeck2ID() {
        let card = Card(id: 115)
        XCTAssertEqual(card.cardID, 115)
    }
    
    func testHashFunction() {
        let cardA = Card(suit: .hearts, rank: Rank.two, deckNumber: 1)
        let cardB = Card(suit: .hearts, rank: Rank.two, deckNumber: 2)
        XCTAssertNotEqual(cardA.cardID, cardB.cardID)
    }
    
}
