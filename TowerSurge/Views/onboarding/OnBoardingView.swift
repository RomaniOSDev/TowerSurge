//
//  OnBoardingView.swift
//  TowerSurge
//
//  Created by Роман Главацкий on 31.10.2025.
//

import SwiftUI

struct OnboardingPage: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
}

struct OnBoardingView: View {
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool?
    @State private var selection = 0

    private let pages: [OnboardingPage] = [
        OnboardingPage(
            imageName: "logo",
            title: "Welcome to TowerSurge",
            description: "Discover the world's legendary towers and learn what makes each of them unique."
        ),
        OnboardingPage(
            imageName: "playBut",
            title: "Play and Learn",
            description: "Take quizzes, unlock facts, and train your memory with fun mini-games."
        )
    ]

    var body: some View {
        ZStack {
            Image(.towerBack)
                .resizable()
                .ignoresSafeArea()

            Color.black.opacity(0.45)
                .ignoresSafeArea()

            VStack(spacing: 24) {
                HStack {
                    Spacer()
                    Button(action: finishOnboarding) {
                        Text("Skip")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.white.opacity(0.2))
                            .clipShape(Capsule())
                    }
                    .padding(.trailing, 24)
                    .padding(.top, 16)
                }

                TabView(selection: $selection) {
                    ForEach(Array(pages.enumerated()), id: \.offset) { index, page in
                        OnboardingPageView(page: page)
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut, value: selection)

                HStack(spacing: 8) {
                    ForEach(pages.indices, id: \.self) { index in
                        Capsule()
                            .fill(index == selection ? Color.white : Color.white.opacity(0.4))
                            .frame(width: index == selection ? 24 : 8, height: 8)
                    }
                }

                Button(action: handleNext) {
                    Text(selection == pages.count - 1 ? "Start" : "Next")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 14)
                        .background(Color.white)
                        .foregroundStyle(Color.black)
                        .clipShape(Capsule())
                        .shadow(color: Color.black.opacity(0.25), radius: 10, y: 6)
                }
                .padding(.bottom, 32)
            }
            .padding(.top, 8)
            .padding(.bottom, 12)
        }
    }

    private func handleNext() {
        if selection < pages.count - 1 {
            withAnimation(.easeInOut) {
                selection += 1
            }
        } else {
            finishOnboarding()
        }
    }

    private func finishOnboarding() {
        isFirstLaunch = false
    }
}

struct OnboardingPageView: View {
    let page: OnboardingPage

    var body: some View {
        VStack(spacing: 32) {
            Spacer()

            Image(page.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 260)
                .shadow(radius: 12)

            VStack(spacing: 12) {
                Text(page.title)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)

                Text(page.description)
                    .font(.system(size: 17, weight: .regular))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.white.opacity(0.85))
                    .lineSpacing(4)
            }
            .padding(.horizontal, 24)

            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    OnBoardingView()
}
