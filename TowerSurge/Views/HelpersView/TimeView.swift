//
//  TimeView.swift
//  TowerSurge
//
//  Created by Роман Главацкий on 02.11.2025.
//

import SwiftUI

struct TimeView: View {
    var time:Int
    var body: some View {
        ZStack{
            Image(.countLabel)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("\(time)")
                .foregroundStyle(.white)
                .font(.title.bold())
        }
        
    }
}

#Preview {
    TimeView(time: 120)
}
