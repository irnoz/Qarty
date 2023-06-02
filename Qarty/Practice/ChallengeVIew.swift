//
//  ChallengeVIew.swift
//  Qarty
//
//  Created by Irakli Nozadze on 31.05.23.
//

import SwiftUI

struct ChallengeView: View {
    let challengeTest: ChallengeTest

    @State var showAnswers = false
    @Binding var numberOfAnswered: Int
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @AppStorage("numberOfQuestions") var numberOfQuestions = 6

    @ViewBuilder
    var body: some View {
        if verticalSizeClass == .compact {
            VStack {
                HStack {
                    Button(action: {
                        showAnswers = !showAnswers
                    }) { // swiftlint:disable:this multiple_closures_with_trailing_closure
                        QuestionView(
                            question: challengeTest.challenge.question)
                    }
                    if showAnswers {
                        Divider()
                        ChoicesView(challengeTest: challengeTest)
                    }
                }
                ScoreView(
                    numberOfQuestions: $numberOfQuestions,
                    numberOfAnswered: $numberOfAnswered
                )
            }
        } else {
            VStack {
                Button(action: {
                    showAnswers = !showAnswers
                }) { // swiftlint:disable:this multiple_closures_with_trailing_closure
                    QuestionView(
                        question: challengeTest.challenge.question)
                    .frame(height: 300)
                }
                ScoreView(
                    numberOfQuestions: $numberOfQuestions,
                    numberOfAnswered: $numberOfAnswered
                )
                if showAnswers {
                    Divider()
                    ChoicesView(challengeTest: challengeTest)
                        .frame(height: 300)
                        .padding()
                }
            }
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    @State static var numberOfAnswered: Int = 0
    static let challengeTest = ChallengeTest(
        challenge: Challenge(
            question: "გთხოვ",
            pronunciation: "Gthkhov",
            answer: "Please"
        ),
        answers: ["Thank you", "Hello", "Goodbye"]
    )

    static var previews: some View {
        return ChallengeView(
            challengeTest: challengeTest,
            numberOfAnswered: $numberOfAnswered
        )
    }
}
