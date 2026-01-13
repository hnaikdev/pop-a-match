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
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        isFlipped ?
                        (isMatched ?
                         LinearGradient(colors: [.green, .mint], startPoint: .topLeading, endPoint: .bottomTrailing) :
                         LinearGradient(colors: [.blue, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
                        :
                        LinearGradient(colors: [.gray.opacity(0.3), .gray.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
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
            .rotation3DEffect(
                .degrees(isFlipped ? 0 : 0),
                axis: (x: 0, y: 1, z: 0)
            )
            .animation(.easeInOut(duration: 0.3), value: isFlipped)
        }
        .disabled(isMatched)
    }
}
