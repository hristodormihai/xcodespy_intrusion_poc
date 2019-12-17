//
//  Validators.swift
//  Test
//
//  Created by Tibor Bodecs on 2019. 12. 15..
//  Copyright © 2019. Tibor Bodecs. All rights reserved.
//

import Foundation

protocol Validator {
    func validate(email: String) -> Bool
}

class RegularExpressionValidator: Validator {

    func validate(email: String) -> Bool {
        let regularExpression = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
            "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
            "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        return NSPredicate(format: "SELF MATCHES[c] %@", regularExpression).evaluate(with: email)
    }
}

class DataDetectorValidator: Validator {
    
    func validate(email: String) -> Bool {
        let dataDetector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)

        let firstMatch = dataDetector.firstMatch(in: email,
                                                 options: .reportCompletion,
                                                 range: .init(location: 0, length: email.count))

        guard let match = firstMatch, match.range.location != NSNotFound, match.range.length == email.count else {
            return false
        }
        return match.url?.scheme == "mailto"
    }
}
