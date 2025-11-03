//
//  QuestionCountView.swift
//  TowerSurge
//
//  Created by Роман Главацкий on 31.10.2025.
//

import SwiftUI

struct QuestionCountView: View {
    var count: Int = 0
    var countMax: Int = 10
    var body: some View {
        ZStack{
            Image(.countLabel)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("\(count)/\(countMax)")
                .foregroundStyle(.white)
                .font(.title)
                .bold()
        }
    }
}

#Preview {
    QuestionCountView()
}
