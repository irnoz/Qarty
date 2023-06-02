//
//  LearnView.swift
//  Qarty
//
//  Created by Irakli Nozadze on 31.05.23.
//

import SwiftUI

struct LearnView: View {
    @StateObject var learningStore = LearningStore(deck: ChallengesViewModel.challenges)

    var body: some View {
        VStack {

            Text("Swipe right if you remembered"
                 + "\nSwipe left if you didn’t.")
            .font(.headline)
            .foregroundColor(.red)
            .bordered()
            .padding(.all)

            Spacer()

            DeckView(
                deck: learningStore.deck,
                onMemorized: { learningStore.score += 1 }
            )

            Button {
                // MARK: Implement Restart Deck Functionality
            } label: {
                HStack {
                    Image(systemName: "gobackward")
                    Text("Restart Deck")
                }
                .foregroundColor(.red)
            }
            .bordered()
            .padding(.all)

            Spacer()

            Text("Remembered \(learningStore.score)"
                 + "/\(learningStore.deck.cards.count)")
            .foregroundColor(.red)
        }
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView()
    }
}
