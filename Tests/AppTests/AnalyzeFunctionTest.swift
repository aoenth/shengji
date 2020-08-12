//
//  AnalyzeFunctionTest.swift.swift
//  
//
//  Created by Kevin Peng on 2020-08-11.
//

import XCTest
@testable import App

extension Array: Comparable where Element == Card {
    public static func < (lhs: [Card], rhs: [Card]) -> Bool {
        let leftValue = lhs.reduce(0) {
            $0 + $1.cardID
        }
        let rightValue = rhs.reduce(0) {
            $0 + $1.cardID
        }
        return leftValue < rightValue
    }
}

class AnalyzeFunctionTest: XCTestCase {
    override class func setUp() {
        Zhu.rank = .two
        Zhu.suit = .diamonds
    }
    
    func testCanDoSingleCard() {
        let result = Hand(cards:[Card(id: 8)]).analyzeHand()
        let expected = [[Card(id: 8)]]
        XCTAssertEqual(result, expected)
    }
    
    func testCanDoTwoCards() {
        let result = Hand(cards:[Card(id: 8), Card(id: 9)]).analyzeHand()
        let expected = [[Card(id: 8)], [Card(id: 9)]]
        XCTAssertEqual(result.sorted(), expected.sorted())
    }
    
    func testCanDoThreeDifferentCards() {
        let result = Hand(cards:[Card(id: 8), Card(id: 9), Card(id: 10)]).analyzeHand()
        let expected = [[Card(id: 8)], [Card(id: 9)], [Card(id: 10)]]
        XCTAssertEqual(result.sorted(), expected.sorted())
    }
    
    func testCanDoPairs() {
        let result = Hand(cards:[Card(id: 8), Card(id: 12)]).analyzeHand()
        let expected = [[Card(id: 8), Card(id: 12)]]
        XCTAssertEqual(result.sorted(), expected.sorted())
    }
    
    func testCanDoTwoPairs() {
        let result = Hand(cards:[Card(id: 8), Card(id: 12), Card(id: 10), Card(id: 14)]).analyzeHand()
        let expected = [[Card(id: 8), Card(id: 12)], [Card(id: 10), Card(id: 14)]]
        XCTAssertEqual(result.sorted(), expected.sorted())
    }
    
    func testCanDoThreePairs() {
        let dict = Card.comparisonDeck
        Card.printDictionary(dict)
        let result = Hand(cards:[Card(id: 14), Card(id: 10),Card(id: 8), Card(id: 12),  Card(id: 11), Card(id: 15)])//.analyzeHand()
        print(result)
        print("Input:")
        print([Card(id: 14), Card(id: 10),Card(id: 8), Card(id: 12),  Card(id: 11), Card(id: 15)])
//        let expected = [[Card(id: 8), Card(id: 12)], [Card(id: 10), Card(id: 14)], [Card(id: 11), Card(id: 15)]]
//        XCTAssertEqual(result.sorted(), expected.sorted())
    }
    
    func testCanDoMixedOneWithTwoPairs() {
        let result = Hand(cards:[Card(id: 8), Card(id: 12), Card(id: 9), Card(id: 13), Card(id: 10)]).analyzeHand()
        let expected = [[Card(id: 8), Card(id: 12)], [Card(id: 9)], [Card(id: 13), Card(id: 10)]]
        XCTAssertEqual(result.sorted(), expected.sorted())
    }
    
    func testCanDoMixedTwoWithTwoPairs() {
        let result = Hand(cards:[Card(id: 8), Card(id: 12), Card(id: 9), Card(id: 10), Card(id: 14), Card(id: 16)]).analyzeHand()
        let expected = [[Card(id: 8), Card(id: 12)], [Card(id: 9)], [Card(id: 10), Card(id: 14)], [Card(id: 16)]]
        XCTAssertEqual(result.sorted(), expected.sorted())
    }
    
    func testCanDoTuolaji() {
        let result = Hand(cards:[Card(id: 8), Card(id: 8), Card(id: 9), Card(id: 9)]).analyzeHand()
        let expected = [[Card(id: 8), Card(id: 8), Card(id: 9), Card(id: 9)]]
        XCTAssertEqual(result.sorted(), expected.sorted())
    }
}
