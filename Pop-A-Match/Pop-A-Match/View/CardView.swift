//
//  CardView.swift
//  Pop-A-Match
//
//  Created by Hiral Naik on 1/12/26.
//

import SwiftUI

struct CardView: View {
    let card: Card
    let isFlipped: Bool
    let isMatched: Bool
    let action: () -> Void
    
    private var cardGradient: LinearGradient {
        if isMatched {
            return LinearGradient(colors: [.green, .mint], startPoint: .topLeading, endPoint: .bottomTrailing)
        } else if isFlipped {
            return LinearGradient(colors: [.blue, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
        } else {
            return LinearGradient(colors: [.gray.opacity(0.3), .gray.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(cardGradient)
                    .shadow(radius: 3)
                
                if isFlipped {
                    Image(systemName: card.symbolName)
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                } else {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.white.opacity(0.3))
                        .frame(width: 30, height: 30)
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .animation(.easeInOut(duration: 0.3), value: isFlipped)
        }
        .disabled(isMatched)
    }
}
