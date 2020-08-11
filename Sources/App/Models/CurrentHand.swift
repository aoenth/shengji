//
//  File.swift
//  
//
//  Created by Serena Ma on 2020-08-09.
//

import Foundation
//
//  File.swift
//
//
//  Created by Serena Ma on 2020-08-05.
//

import Foundation
struct CurrentHand {
    var Played: [Hand]
    let FstPlayer: Int
}
extension CurrentHand{
    init (playerId: Int){
        self.Played = [Hand]()
        self.FstPlayer = playerId
    }
    func validateHand(hand:Hand) -> Bool{
        if hand.size() == 1{
            return true
        }
        if hand.isDui() {
            return true
        }
        if hand.isSameSuit(){
            return true
        }
        return false
    }
    mutating func putHand(hand: [Card]){
        self.Played.append(Hand(hand: hand))
    }
    mutating func removeLastHand(){
        self.Played.remove(at: self.Played.count-1)
    }
    
}
