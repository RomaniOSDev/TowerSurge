//
//  GamesView.swift
//  TowerSurge
//
//  Created by Роман Главацкий on 31.10.2025.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        ZStack {
            Image(.towerBack)
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 16) {
                NavigationLink(destination: TowerQuizView()) {
                    Image(.towerQuiz)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                NavigationLink(destination: TowerFactsView()) {
                    Image(.towerFact)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                NavigationLink(destination: BuildMatchView()) {
                    Image(.bildmatch)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    NavigationView { GamesView() }
}


