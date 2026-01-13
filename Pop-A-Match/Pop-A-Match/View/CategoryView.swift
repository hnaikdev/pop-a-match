//
//  CategoryView.swift
//  Pop-A-Match
//
//  Created by Hiral Naik on 1/12/26.
//

import SwiftUI

struct CategoryView: View {
    let category: Symbol
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.blue.opacity(0.6), .blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Image(systemName: category.icon)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
            
            Text(category.rawValue)
                .font(.subheadline.bold())
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .shadow(radius: 5)
    }
}
