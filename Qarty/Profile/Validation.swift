//
//  Validation.swift
//  Qarty
//
//  Created by Irakli Nozadze on 30.05.23.
//

import Foundation

enum Field: String {
    case username
    case password
}

enum ValidationState {
    case success
    case failure
}

enum ValidationType {
    case isNotEmpty
    case minCharacters(min: Int)
    case hasSymbols
    case hasUppercasedLetters

    func fulfills(string: String) -> Bool {
        switch self {
        case .isNotEmpty:
            return !string.isEmpty
        case .minCharacters(min: let min):
            return string.count > min
        case .hasSymbols:
            return string.hasSpecialCharacters()
        case .hasUppercasedLetters:
            return string.hasUppercasedCharacters()
        }
    }
}

struct Validation: Identifiable {
    var id: Int // swiftlint:disable:this identifier_name
    var field: Field
    var validationType: ValidationType
    var state: ValidationState

    init(string: String, id: Int, field: Field, validationType: ValidationType) { // swiftlint:disable:this identifier_name line_length
        self.id = id
        self.field = field
        self.validationType = validationType
        self.state = validationType.fulfills(string: string) ? .success : .failure
    }
}
