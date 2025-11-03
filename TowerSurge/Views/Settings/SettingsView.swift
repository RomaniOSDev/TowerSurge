//
//  SettingsView.swift
//  TowerSurge
//
//  Created by Роман Главацкий on 31.10.2025.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @State private var policyUrl = "https://www.termsfeed.com/live/e02cffa0-b8c1-4818-81b2-c8ddfd493c3c"
    var body: some View {
        ZStack{
            Image(.towerBack)
                .resizable()
                .ignoresSafeArea()
            VStack{
                //MARK: Privacy
                Button {
                    if let url = URL(string: policyUrl) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    ZStack{
                        Image(.countLabel)
                            .resizable()
                        Text("Privacy Policy")
                    }.frame(width: 290, height: 110)
                }
                
                //MARK: Rate app
                Button {
                    SKStoreReviewController.requestReview()
                } label: {
                    ZStack{
                        Image(.countLabel)
                            .resizable()
                        Text("Rate us")
                    }.frame(width: 290, height: 110)
                }
                
                //MARK: Rules
                NavigationLink {
                RulesView()
                } label: {
                    ZStack{
                        Image(.countLabel)
                            .resizable()
                        Text("Rules")
                    }.frame(width: 290, height: 110)
                }


            }
            .foregroundStyle(.white)
            .font(.system(size: 25, weight: .heavy, design: .monospaced))
            .minimumScaleFactor(0.5)
            .padding()
        }
    }
}

#Preview {
    NavigationView { SettingsView() }
}


