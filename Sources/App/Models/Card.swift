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
            
            let deckNumber = id % 8 < 4 ? 1 : 2
            self.deckNumber = deckNumber
        }
    }
    
    init(string: String) {
        let stringArray = Array(string)
        
        if let deckNumberString = string.last,
           let deckNumber = Int(String(deckNumberString)) {
            self.deckNumber = deckNumber
        } else {
            fatalError("Invalid deck number")
        }
        
        if string.lowercased().starts(with: "rb")
            || string.lowercased().starts(with: "lb") {
            if string.lowercased().starts(with: "rb") {
                self.rank = .rightBower
                self.suit = .rightBower
            } else {
                self.rank = .leftBower
                self.suit = .leftBower
            }
            return
        }
        
        guard 3 ... 4 ~= string.count else {
            fatalError("Invalid string")
        }
        
        guard let suit = stringArray.first else {
            fatalError("Invalid suit")
        }
        
        switch suit.lowercased() {
        case "♦️", "d":
            self.suit = .diamonds
        case "♠️", "s":
            self.suit = .spades
        case "❤️", "h":
            self.suit = .hearts
        case "♣️", "c":
            self.suit = .clubs
        default:
            fatalError("Invalid suit")
        }
        
        let rank: String
        if string.count == 3 {
            rank = String(stringArray[1])
        } else {
            rank = String(stringArray[1...2])
        }
        switch rank.lowercased() {
        case "k":
            self.rank = .king
        case "q":
            self.rank = .queen
        case "j":
            self.rank = .jack
        case "a":
            self.rank = .ace
        default:
            if let rank = Int(rank), let rankEnum = Rank(rawValue: rank) {
                self.rank = rankEnum
            } else {
                fatalError("Invalid rank")
            }
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
