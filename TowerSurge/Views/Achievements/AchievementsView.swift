//
//  AchievementsView.swift
//  TowerSurge
//
//  Created by Роман Главацкий on 31.10.2025.
//

import SwiftUI

struct AchievementsView: View {
    @AppStorage("allWins") var allWins: Int?
    var body: some View {
        ZStack{
            Image(.qizBack)
                .resizable()
                .ignoresSafeArea()
            VStack{
                if let allWins = allWins {
                    ScrollView {
                        CupComplitedView(cup: .cupSilver, countWin: allWins, countAll: 15)
                        CupComplitedView(cup: .cupGold, countWin: allWins, countAll: 30)
                        CupComplitedView(cup: .cupBriliant, countWin: allWins, countAll: 90)
                        CupComplitedView(cup: .cupRubin, countWin: allWins, countAll: 150)
                    }
                }else{
                    Text("No achievements yet. Please, play more games!")
                        .foregroundStyle(.black)
                        .font(.system(size: 32, weight: .heavy, design: .monospaced))
                        .multilineTextAlignment(.center)
                }
                
            }.padding()
        }
    }
}

#Preview {
    NavigationView { AchievementsView() }
}


