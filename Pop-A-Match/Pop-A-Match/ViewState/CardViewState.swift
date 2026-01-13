//
//  CardViewState.swift
//  Pop-A-Match
//
//  Created by Hiral Naik on 1/12/26.
//

import SwiftUI
import Combine

final class CardViewState: ObservableObject {
    @Published var cards: [Card] = []
    @Published var flippedIndices: [Int] = []
    @Published var matchedIndices: [Int] = []
    @Published var moves = 0
    @Published var isChecking = false
}
