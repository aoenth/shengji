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
    static var leftBower: Card {
        self.init(suit: .leftBower, rank: .leftBower, deckNumber: 1)
    }

    static var rightBower: Card {
        self.init(suit: .rightBower, rank: .rightBower, deckNumber: 1)
    }
}

extension Card {
    var cardID: Int {
        if rank == .leftBower {
            return 112 + deckNumber - 1
        }
        else if rank == .rightBower {
            return 114 + deckNumber - 1
        }
        else{
            return 8 * rank.rawValue + suit.rawValue + (deckNumber - 1) * 4
        }
        
    }
}



extension Card: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(cardID)
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        "\(suit)\(rank)(\(deckNumber))"
    }
}
