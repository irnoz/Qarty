//
//  LearningStore.swift
//  Qarty
//
//  Created by Irakli Nozadze on 31.05.23.
//

import Foundation

class LearningStore: ObservableObject {
    @Published var card: FlashCard?
    @Published var deck: FlashDeck
    @Published var score = 0

    init(deck: [Challenge]) {
        self.deck = FlashDeck(from: deck)
        card = getNextCard()
    }

    func getNextCard() -> FlashCard? {
        guard let card = deck.cards.last else {
          return nil
        }

        self.card = card
        deck.cards.removeLast()

        return self.card
    }
}
