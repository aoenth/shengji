//
//  ShenJiBasicTest.swift
//  AppTests
//
//  Created by Kevin Peng on 2020-08-02.
//

import XCTest
@testable import App

class ShenJiBasicTest: XCTestCase {
    func testCompareTwoRightBowers_shouldEqual() {
        Zhu.suit = nil
        let rightBower = Card(suit: .rightBower, rank: .rightBower, deckNumber: 1)
        let rightBower2 = Card(suit: .rightBower, rank: .rightBower, deckNumber: 1)
        XCTAssertEqual(rightBower, rightBower2)
    }

    func testCompareTwoLeftBowers_shouldEqual() {
        Zhu.suit = nil
        let lhs = Card.leftBower
        let rhs = Card.leftBower
        XCTAssertEqual(lhs, rhs)
    }

    func testCompareLeftRightBowers_shouldBeLessThan() {
        Zhu.suit = nil
        let lhs = Card.leftBower
        let rhs = Card.rightBower
        XCTAssertLessThan(lhs, rhs)
    }

    func testCompareRightLeftBowers_shouldBeGreaterThan() {
        Zhu.suit = nil
        let lhs = Card.rightBower
        let rhs = Card.leftBower
        XCTAssertGreaterThan(lhs, rhs)
    }

    func testCompareRightBowerAce_shouldBeGreaterThan() {
        Zhu.suit = nil
        let lhs = Card.rightBower
        let rhs = Card(suit: .spades, rank: .ace, deckNumber: 1)
        XCTAssertGreaterThan(lhs, rhs)
    }

    func testCompareTwoAce_shouldBeLessThan() {
        Zhu.suit = nil
        let lhs = Card(suit: .spades, rank: .two, deckNumber: 1)
        let rhs = Card(suit: .spades, rank: .ace, deckNumber: 1)
        XCTAssertLessThan(lhs, rhs)
    }

    func testCompareKingAce_shouldBeLessThan() {
        Zhu.suit = nil
        let lhs = Card(suit: .hearts, rank: .king, deckNumber: 1)
        let rhs = Card(suit: .spades, rank: .ace, deckNumber: 1)
        XCTAssertLessThan(lhs, rhs)
    }

    func testCompareZhuTwoNonZhuAce_shouldBeGreaterThan() {
        Zhu.suit = .hearts
        let lhs = Card(suit: .hearts, rank: .two, deckNumber: 1)
        let rhs = Card(suit: .spades, rank: .ace, deckNumber: 2)
        XCTAssertGreaterThan(lhs, rhs)
    }

    func testCompareZhuTwoZhuThree_shouldBeLessThan() {
        Zhu.suit = .diamonds
        let lhs = Card(suit: .diamonds, rank: .two, deckNumber: 1)
        let rhs = Card(suit: .diamonds, rank: .three, deckNumber: 2)
        XCTAssertLessThan(lhs, rhs)
    }

    func testCompareZhuTwoLeftBower_shouldBeLessThan() {
        Zhu.suit = .diamonds
        let lhs = Card(suit: .diamonds, rank: .two, deckNumber: 1)
        let rhs = Card.leftBower
        XCTAssertLessThan(lhs, rhs)
    }

    func testCompareZhuTwoRightBower_shouldBeLessThan() {
        Zhu.suit = .diamonds
        let lhs = Card(suit: .diamonds, rank: .two, deckNumber: 1)
        let rhs = Card.rightBower
        XCTAssertLessThan(lhs, rhs)
    }

    func testCompareZhuTwoZhuTwoDifferentDeck_shouldBeEqual() {
        Zhu.suit = .diamonds
        let lhs = Card(suit: .diamonds, rank: .two, deckNumber: 1)
        let rhs = Card(suit: .diamonds, rank: .two, deckNumber: 2)
        XCTAssertEqual(lhs, rhs)
    }

    func testNoZhuCompareTwoDifferentNonZhu_shouldBeLessThan() {
        Zhu.suit = nil
        let lhs = Card(suit: .diamonds, rank: .five, deckNumber: 1)
        let rhs = Card(suit: .diamonds, rank: .ten, deckNumber: 2)
        XCTAssertLessThan(lhs, rhs)
    }

    func testZhu3CompareZhu5AndNonZhu5_shouldBeGreaterThan() {
        Zhu.suit = .diamonds
        Zhu.level = .three
        let lhs = Card(suit: .diamonds, rank: .five, deckNumber: 1)
        let rhs = Card(suit: .spades, rank: .five, deckNumber: 2)
        XCTAssertGreaterThan(lhs, rhs)
    }
}
