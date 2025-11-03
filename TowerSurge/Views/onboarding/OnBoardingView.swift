//
//  OnBoardingView.swift
//  TowerSurge
//
//  Created by Роман Главацкий on 31.10.2025.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool?
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button {
            isFirstLaunch = false
        } label: {
            Text("Skip")
        }

    }
}

#Preview {
    OnBoardingView()
}
