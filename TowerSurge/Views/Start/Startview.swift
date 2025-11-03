//
//  Startview.swift
//  TowerSurge
//
//  Created by Роман Главацкий on 31.10.2025.
//

import SwiftUI

struct Startview: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.towerBack)
                    .resizable()
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    HStack{
                        NavigationLink(destination: AchievementsView()) {
                            Image(.achivmentBut)
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        Spacer()
                        NavigationLink(destination: SettingsView()) {
                            Image(.setBack)
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                    }
                    
                    Image(.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Spacer()
                    
                    NavigationLink(destination: GamesView()) {
                        Image(.playBut)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 170)
                    }
                    
                }
                .padding()
            }
        }
    }
}

#Preview {
    Startview()
}
