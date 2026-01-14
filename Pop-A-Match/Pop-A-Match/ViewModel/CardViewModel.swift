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
    
    private var symbols: [String] {
        let mySymbols = category.symbols.shuffled()
        var local = [String]()
        
        switch level {
        case .easy:
            local = Array(mySymbols[0...2])      // 4 pairs = 8 cards (2x4 grid)
        case .medium:
            local = Array(mySymbols[0...5])      // 6 pairs = 12 cards (3x4 grid)
        case .hard:
            local = Array(mySymbols[0...9])      // 8 pairs = 16 cards (4x4 grid)
        }
        
        return local.shuffled()
    }
    
    var categoryName: String {
        return category.rawValue
    }
    
    var isGameFinished: Bool {
        return viewState.matchedIndices.count == viewState.cards.count && !viewState.cards.isEmpty
    }
    
    var totalItems: Int {
        if symbols.count > 3 {
            return 4
        }
        return symbols.count
    }
    
    func setupGame() {
        var cards = [Card]()
        
        symbols.forEach { symbol in
            cards.append(Card(symbolName: symbol))
            cards.append(Card(symbolName: symbol))
        }
        
        viewState.cards = cards.shuffled()
        viewState.flippedIndices = []
        viewState.matchedIndices = []
        viewState.moves = 0
        viewState.isChecking = false
    }
    
    func flipCard(at index: Int) {
        guard !viewState.isChecking, !viewState.flippedIndices.contains(index), !viewState.matchedIndices.contains(index), viewState.flippedIndices.count < 2 else {
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
        
        if viewState.cards[firstIndex].symbolName == viewState.cards[secondIndex].symbolName {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.viewState.matchedIndices.append(contentsOf: self.viewState.flippedIndices)
                self.viewState.flippedIndices = []
                self.viewState.isChecking = false
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.viewState.flippedIndices = []
                self.viewState.isChecking = false
            }
        }
    }
}
