//
//  FlashCard.swift
//  Qarty
//
//  Created by Irakli Nozadze on 31.05.23.
//

import Foundation

struct FlashCard: Identifiable {
    var id = UUID() // swiftlint:disable:this identifier_name
    var card: Challenge
    var isActive = true
}

extension FlashCard: Equatable {
  static func == (lhs: FlashCard, rhs: FlashCard) -> Bool {
    return lhs.card.question == rhs.card.question
      && lhs.card.answer == rhs.card.answer
  }
}
