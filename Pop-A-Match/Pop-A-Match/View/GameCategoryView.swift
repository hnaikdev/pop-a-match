//
//  GameCategoryView.swift
//  Pop-A-Match
//
//  Created by Hiral Naik on 1/12/26.
//

import SwiftUI

struct GameCategoryView: View {
    
    @State private var selectedLevel: Level = .easy
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [.pink.opacity(0.8), .teal.opacity(0.8), .yellow.opacity(0.8), .blue.opacity(0.8), .purple.opacity(0.8)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        Text("Choose a Theme")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.primary)
                            .padding(.top)
                        
                        Picker("Level", selection: $selectedLevel) {
                            ForEach(Level.allCases, id: \.id) { level in
                                Text(level.rawValue)
                                    .font(.footnote.bold())
                                    .foregroundStyle(.primary)
                                    .tag(level)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding([.leading, .trailing], 16)
                        .colorMultiply(.pink)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(Symbol.allCases) { category in
                                NavigationLink {
                                    let viewState = CardViewState()
                                    let viewModel = CardViewModel(viewState: viewState, category: category, level: selectedLevel)
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
