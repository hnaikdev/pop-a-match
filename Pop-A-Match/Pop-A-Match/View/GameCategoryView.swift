//
//  GameCategoryView.swift
//  Pop-A-Match
//
//  Created by Hiral Naik on 1/12/26.
//

import SwiftUI

struct GameCategoryView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [.indigo.opacity(0.3), .purple.opacity(0.3), .pink.opacity(0.3)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        Text("Choose a Theme")
                            .font(.largeTitle.bold())
                            .foregroundColor(.primary)
                            .padding(.top)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(Symbol.allCases) { category in
                                NavigationLink {
                                    let viewState = CardViewState()
                                    let viewModel = CardViewModel(viewState: viewState, category: category)
                                    GameView(viewState: viewState, viewModel: viewModel)
                                } label: {
                                    CategoryView(category: category)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .transition(.scale.combined(with: .opacity))
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
