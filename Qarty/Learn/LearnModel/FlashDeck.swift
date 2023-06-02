//
//  FlashDeck.swift
//  Qarty
//
//  Created by Irakli Nozadze on 31.05.23.
//

import Foundation

class FlashDeck: ObservableObject {
    @Published var cards: [FlashCard]

    init(from words: [Challenge]) {
        cards = words.map {
            FlashCard(card: $0)
        }
    }
}
