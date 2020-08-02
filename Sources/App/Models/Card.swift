import Foundation

struct Card {
    let suit: Suit
    let rank: Rank
    let deckNumber: Int
}

extension Card {
    init(id: Int) {
        guard 8 ... 115 ~= id else {
            fatalError("Unable to initialize card. Invalid ID")
        }
        if id >= 114 {
            self.suit = .rightBower
            self.rank = .rightBower
            self.deckNumber = id % 114 + 1
        } else if id >= 112 {
            self.suit = .leftBower
            self.rank = .leftBower
            self.deckNumber = id % 112 + 1
        } else {
            let suit = id % 4
            self.suit = Suit(rawValue: suit)!

            let rank = id / 8
            self.rank = Rank(rawValue: rank)!

            let deckNumber = id % 8 < 3 ? 1 : 2
            self.deckNumber = deckNumber
        }
    }
}

extension Card {
    var id: Int {
        8 * rank.rawValue + (suit.rawValue - 1) + (deckNumber - 1) * 4
    }
}

extension Card: Comparable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        if Zhu.value == nil {
            return lhs.rank < rhs.rank
        }

        switch (lhs.suit, rhs.suit) {
        case (.rightBower, _):
            return false
        case (.leftBower, _):
            return rhs.suit == .rightBower
        default:
            break
        }

        if lhs.suit == Zhu.value && rhs.suit == Zhu.value {
            return lhs.rank < rhs.rank
        }

        if lhs.suit == Zhu.value {
            return false
        }

        if rhs.suit == Zhu.value {
            return true
        }

        return lhs.rank < rhs.rank
    }
}
