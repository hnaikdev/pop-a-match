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
    
    init(viewState: CardViewState, category: Symbol) {
        self.viewState = viewState
        self.category = category
    }
    
    private var symbols: [String] {
        category.symbols
    }
    
    var categoryName: String {
        return category.rawValue
    }
    
    var isGameFinished: Bool {
        return viewState.matchedIndices.count == viewState.cards.count && !viewState.cards.isEmpty
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
