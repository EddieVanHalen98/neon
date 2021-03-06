//
//  String+Ext.swift
//  neon
//
//  Created by James Saeed on 30/10/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import Foundation

extension String {
    
    /// Capitalizes a string but excludes commonly non-capitalized words & excludes dates
    ///
    /// - Returns:
    /// A 'smart' capitalized string
    func smartCapitalization() -> String {
        var title = ""
        let words = self.lowercased().components(separatedBy: " ")
        
        for word in words {
            if word == "to" || word == "and" || word == "with" || word == "for" || word == "a" || word == "at" || word == "in" || word.hasPrefix("1") || word.hasPrefix("2") || word.hasPrefix("3") || word.hasPrefix("4") || word.hasPrefix("5") || word.hasPrefix("6") || word.hasPrefix("7") || word.hasPrefix("8") || word.hasPrefix("9") || word.hasPrefix("0") {
                title += (word + " ")
            } else {
                title += (word.capitalized + " ")
            }
        }
        
        return String(title.dropLast())
    }
    
    @available(*, deprecated, message: "This function will be redundant after a small ToDoUrgency refactor")
    func urgencyToColorString() -> String {
        if self == "urgent" {
            return "UrgentColor"
        } else if self == "soon" {
            return "AccentColor"
        } else if self == "whenever" {
            return "TextColor"
        }
        
        return self
    }
}
