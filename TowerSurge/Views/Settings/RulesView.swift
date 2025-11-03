//
//  RulesView.swift
//  TowerSurge
//
//  Created by Роман Главацкий on 02.11.2025.
//

import SwiftUI

struct RulesView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image(.qizBack)
                .resizable()
                .ignoresSafeArea()
            VStack {
                
                Image(.rulesLabel)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                    .onTapGesture {
                        dismiss()
                    }
                Image(.floor1)
                    .resizable()
                    
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
            }.padding()
        }
    }
}

#Preview {
    RulesView()
}
