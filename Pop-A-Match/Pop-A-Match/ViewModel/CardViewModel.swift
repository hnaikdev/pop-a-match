//
//  CardViewModel.swift
//  Pop-A-Match
//
//  Created by Hiral Naik on 1/12/26.
//

import Foundation

final class CardViewModel {
    private let viewState: CardViewState
    private let category: Symbol
    private let level: Level
    
    init(viewState: CardViewState, category: Symbol, level: Level) {
        self.viewState = viewState
        self.category = category
        self.level = level
    }
    
    var categoryName: String {
        category.rawValue
    }
    
    var isGameFinished: Bool {
        viewState.matchedIndices.count == viewState.cards.count && !viewState.cards.isEmpty
    }
    
    var totalItems: Int {
        level.columnCount
    }
    
    func setupGame() {
        let selected = category.symbols.shuffled().prefix(level.pairCount)
        let cards = selected.flatMap { symbol in
            [Card(symbolName: symbol), Card(symbolName: symbol)]
        }.shuffled()
        
        viewState.cards = cards
        viewState.flippedIndices = []
        viewState.matchedIndices = []
        viewState.moves = 0
        viewState.isChecking = false
    }
    
    func flipCard(at index: Int) {
        guard !viewState.isChecking,
              !viewState.flippedIndices.contains(index),
              !viewState.matchedIndices.contains(index),
              viewState.flippedIndices.count < 2 else {
            return
        }
        
        viewState.flippedIndices.append(index)
        
        if viewState.flippedIndices.count == 2 {
            viewState.moves += 1
            viewState.isChecking = true
            checkForMatch()
        }
    }
    
    private func checkForMatch() {
        let firstIndex = viewState.flippedIndices[0]
        let secondIndex = viewState.flippedIndices[1]
        let isMatch = viewState.cards[firstIndex].symbolName == viewState.cards[secondIndex].symbolName
        
        Task { @MainActor in
            try? await Task.sleep(for: .milliseconds(600))
            if isMatch {
                self.viewState.matchedIndices.formUnion(self.viewState.flippedIndices)
            }
            self.viewState.flippedIndices = []
            self.viewState.isChecking = false
        }
    }
}
