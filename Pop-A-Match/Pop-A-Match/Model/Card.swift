//
//  Card.swift
//  Pop-A-Match
//
//  Created by Hiral Naik on 1/12/26.
//

import Foundation

struct Card: Identifiable {
    let id = UUID()
    let symbolName: String
    var isFlipped: Bool = false
    var isMatched: Bool = false
}
