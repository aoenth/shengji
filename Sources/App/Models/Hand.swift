//
//  File.swift
//  
//
//  Created by Serena Ma on 2020-08-05.
//

import Foundation
struct Hand {
    var hand: [Card]
}
extension Hand{
    init (cards: [Card]){
        self.hand = cards
    }
    func size() -> Int {
        return self.hand.count
    }
    func isDui() -> Bool {
        if self.hand.count == 2 &&
            self.hand[0].suit == self.hand[1].suit &&
            self.hand[0].rank == self.hand[1].rank {
                return true
        }
        return false
    }
    func isSameSuit() -> Bool{
        if self.hand[0].isZhu(){
            for i in self.hand{
                if !i.isZhu(){
                    return false
                }
            }
            return true
        }
        else{
            let handSuit = self.hand[0].suit
            for i in self.hand{
                if i.suit != handSuit || i.isZhu(){
                    return false
                }
            }
            return true
        }
        
    }
    func analyzeHand() -> [[Card]]{
        var ret = [[Card]]()
        let groupHand = Dictionary(grouping: self.hand) {Card.comparisonDeck[$0]!}
        var tuo = [Card]()
        var foundTuo = 0
        print(groupHand)
        for i in groupHand.keys.sorted(){
            print("analyzing rank \(i) with value \(groupHand[i]!)")
            if groupHand[i]!.count == 1{
                ret.append(groupHand[i]!)
            }
            else if groupHand[i]!.count == 2 {
                if Hand(cards: groupHand[i]!).isDui(){
                    if tuo.count == 0  {
                        print("putting \(groupHand[i]!) into temporary var tuo")
                        tuo = groupHand[i]!
                        foundTuo = i
                        print("tuo: \(tuo)")
                        print("foundTuo: \(foundTuo)")
                    }
                    else if tuo.count != 0 && i == foundTuo+1
                        && Hand(cards: [tuo[0],groupHand[i]![0]]).isSameSuit(){
                        print("found tuo \(groupHand[i]!) at \(i)")
                        tuo.append(contentsOf:groupHand[i]!)
                        foundTuo = i
                        print("tuo: \(tuo)")
                        print("foundTuo: \(foundTuo)")
                    }
                    else {
                        print("couldnt find tuo")
                        ret.append(tuo)
                        ret.append(groupHand[i]!)
                        tuo = [Card]()
                        foundTuo = 0
                        print("tuo: \(tuo)")
                        print("foundTuo: \(foundTuo)")
                    }
                }
                else{
                    for card in groupHand[i]!{
                        ret.append([card])
                    }
                }
            }
        }
        if tuo.count != 0 {
            ret.append(tuo)
        }
        return ret
    }
    
}
