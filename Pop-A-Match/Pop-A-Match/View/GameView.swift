//
//  GameView.swift
//  Pop-A-Match
//
//  Created by Hiral Naik on 1/12/26.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var viewState: CardViewState
    let viewModel: CardViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.pink.opacity(0.8), .teal.opacity(0.8), .yellow.opacity(0.8), .blue.opacity(0.8), .purple.opacity(0.8)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                VStack(spacing: 8) {
                    Text("Memory Match")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Text(viewModel.categoryName)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Text("Find all the matching pairs!")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(.top, 40)
                
                HStack(spacing: 40) {
                    VStack(spacing: 4) {
                        Text("Moves")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                        Text("\(viewState.moves)")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                    
                    VStack(spacing: 4) {
                        Text("Matched")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                        Text("\(viewState.matchedIndices.count / 2)/\(viewState.cards.count / 2)")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                    
                    Button(action: {
                        withAnimation {
                            viewModel.setupGame()
                        }
                    }) {
                        Text("New Game")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(
                                LinearGradient(
                                    colors: [.blue, .purple],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
                .padding()
                .background(.white.opacity(0.2))
                .cornerRadius(15)
                .padding(.horizontal)
                
                // Win Message
                if viewModel.isGameFinished {
                    VStack(spacing: 8) {
                        Text("🎉 Congratulations! 🎉")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                        Text("You completed the game in \(viewState.moves) moves!")
                            .font(.body)
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [.green, .mint],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .transition(.scale.combined(with: .opacity))
                }
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: viewModel.totalItems), spacing: 12) {
                    ForEach(Array(viewState.cards.enumerated()), id: \.element.id) { index, card in
                        CardView(
                            card: card,
                            isFlipped: viewState.flippedIndices.contains(index) || viewState.matchedIndices.contains(index),
                            isMatched: viewState.matchedIndices.contains(index)
                        ) {
                            withAnimation {
                                viewModel.flipCard(at: index)
                            }
                        }
                    }
                }
                .padding()
                
                Text("Tap cards to flip them and find matching pairs")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.bottom, 20)
                
                Spacer()
            }
        }
    }
}
