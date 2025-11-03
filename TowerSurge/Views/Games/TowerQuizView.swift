//
//  TowerQuizView.swift
//  TowerSurge
//
//  Created by Роман Главацкий on 31.10.2025.
//

import SwiftUI

struct TowerQuizView: View {
    var body: some View {
        ZStack {
            Image(.towerBack)
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 20) {
                
                ForEach(QuizLevel.allCases, id: \.self) { level in
                    NavigationLink(destination: QuizView(level: level)) {
                        Image(level.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                
            }
            .padding(40)
        }
    }
    
    private func levelColor(for level: QuizLevel) -> Color {
        switch level {
        case .easy:
            return Color.green
        case .medium:
            return Color.orange
        case .hard:
            return Color.red
        }
    }
}

#Preview {
    NavigationView { TowerQuizView() }
}
