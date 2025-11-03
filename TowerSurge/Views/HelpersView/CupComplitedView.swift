//
//  CupComplitedView.swift
//  TowerSurge
//
//  Created by Роман Главацкий on 02.11.2025.
//

import SwiftUI

struct CupComplitedView: View {
    var cup: ImageResource
    var countWin: Int
    var countAll: Int
    var body: some View {
        ZStack {
            Image(.backComp)
                .resizable()
            HStack {
                Image(cup)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                VStack(alignment: .trailing) {
                    Image(countWin >= countAll ? .compCheck : .noComp)
                        .resizable()
                        .frame(width: 60, height: 60)
                    Spacer()
                    VStack(alignment: .leading) {
                        HStack {
                            Text("\(countWin)")
                                .opacity(countWin >= countAll ? 1 : 0.3)
                            Text("/\(countAll)")
                            
                        }
                        .foregroundStyle(.white)
                        .font(.largeTitle.bold())
                        Text("Floors built")
                            .foregroundStyle(.white)
                    }
                }
            }.padding()
            
        }
        .frame(height: 240)
        .cornerRadius(20)
    }
}

#Preview {
    CupComplitedView(cup: .cupGold, countWin: 15, countAll: 15)
        .padding()
}
