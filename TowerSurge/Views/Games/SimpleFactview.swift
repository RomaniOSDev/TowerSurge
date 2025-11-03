//
//  SimpleFactview.swift
//  TowerSurge
//
//  Created by Роман Главацкий on 03.11.2025.
//

import SwiftUI

struct SimpleFactview: View {
    var fact: FactsTower
    var body: some View {
        ZStack {
            Image(.qizBack)
                .resizable()
                .ignoresSafeArea()
            ScrollView{
            VStack{
                Image(fact.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(fact.discriptImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                }
            }.padding()
        }
    }
}

#Preview {
    SimpleFactview(fact: FactsTower.burj)
}
