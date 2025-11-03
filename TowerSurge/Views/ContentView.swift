//
//  ContentView.swift
//  TowerSurge
//
//  Created by Роман Главацкий on 31.10.2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool?
    var body: some View {
        if isFirstLaunch == nil {
            OnBoardingView()
        }else{
            Startview()
        }
    }
}

#Preview {
    ContentView()
}
