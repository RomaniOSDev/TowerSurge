//
//  BuildMatchView.swift
//  TowerSurge
//
//  Created by Роман Главацкий on 31.10.2025.
//

import SwiftUI

struct Card: Identifiable {
    let id: Int
    let imageResource: ImageResource
    let imageIndex: Int // Индекс картинки для сравнения
    var isFlipped: Bool = false
    var isMatched: Bool = false
}

struct BuildMatchView: View {
    @AppStorage("allWins") var allWins: Int?
    @State private var cards: [Card] = []
    @State private var flippedCards: [Int] = []
    @State private var matchedPairs: Int = 0
    @State private var timeRemaining: Int = 120 // 120 секунд
    @State private var timer: Timer?
    @State private var gameStarted: Bool = false
    @State private var gameOver: Bool = false
    @State private var showTowerBuilt: Bool = false // Экран "THE TOWER IS BUILT!"
    @State private var points: Int = 0 // Счетчик очков
    
    private let cardImages: [ImageResource] = [.card1, .card2, .card3, .card4, .card5, .card6]
    private let rows = 3
    private let columns = 4
    private let totalPairs = 6
    
    var body: some View {
        ZStack {
            Image(.qizBack)
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 20) {
                // Таймер и счет
                TimeView(time: timeRemaining)
                    .frame(height: 65)
                VStack {
                    Text("Completed Levels: ")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("\(points)")
                        .font(.title)
                        .fontWeight(.bold)
                }
                Spacer()
                
                // Игровое поле
                if gameOver {
                    gameResultView
                } else if showTowerBuilt {
                    towerBuiltView
                } else {
                    gameFieldView
                }
                Spacer()
            }
            .padding()
            
            .onAppear {
                resetGame()
            }
            .onDisappear {
                stopTimer()
            }
        }
    }
    
    private var gameFieldView: some View {
        VStack(spacing: 10) {
            ForEach(0..<rows, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(0..<columns, id: \.self) { col in
                        let index = row * columns + col
                        if index < cards.count {
                            CardView(card: cards[index])
                                .onTapGesture {
                                    if !gameStarted {
                                        startGame()
                                    }
                                    flipCard(at: index)
                                }
                        }
                    }
                }
            }
        }
    }
    
    private var towerBuiltView: some View {
        ZStack {
            Color.black.opacity(0.8).cornerRadius(10)
            VStack(spacing: 30) {
                Image(.towerISBild)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Button(action: {
                    continueGame()
                }) {
                    Image(.nextbut)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
    
    private var gameResultView: some View {
        VStack(spacing: 30) {

            Image(.cup)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Game over!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Your score: \(points)")
                .font(.title)
                .foregroundColor(.secondary)
            Spacer()
            NavigationLink(destination: BuildMatchView()) {
                Image(.repeaat)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .padding(.horizontal)
        }
        .padding()
    }
    
    private func setupGame() {
        // Создаем пары карточек
        var cardPairs: [Card] = []
        for (index, imageResource) in cardImages.prefix(totalPairs).enumerated() {
            cardPairs.append(Card(id: index * 2, imageResource: imageResource, imageIndex: index))
            cardPairs.append(Card(id: index * 2 + 1, imageResource: imageResource, imageIndex: index))
        }
        
        // Перемешиваем карточки
        cards = cardPairs.shuffled()
        matchedPairs = 0
        flippedCards = []
        gameStarted = false
        gameOver = false
        showTowerBuilt = false
    }
    
    private func resetCards() {
        // Перезапускаем только карточки (не таймер и не очки)
        setupGame()
    }
    
    private func continueGame() {
        // Добавляем очко
        points += 1
        // Прибавляем очко к allWins
        let currentWins = allWins ?? 0
        allWins = currentWins + 1
        // Скрываем экран
        showTowerBuilt = false
        // Перезапускаем карточки
        resetCards()
        // Продолжаем таймер (он был остановлен при показе экрана)
        if gameStarted && timeRemaining > 0 {
            startTimer()
        }
    }
    
    private func startGame() {
        gameStarted = true
        startTimer()
    }
    
    private func startTimer() {
        // Убеждаемся, что таймер не запущен
        if timer != nil {
            return
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopTimer()
                gameOver = true
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func flipCard(at index: Int) {
        let card = cards[index]
        
        // Нельзя переворачивать уже совпавшие или уже перевернутые карточки
        if card.isMatched || card.isFlipped {
            return
        }
        
        // Если уже перевернуто 2 карточки, нужно подождать
        if flippedCards.count >= 2 {
            return
        }
        
        // Переворачиваем карточку
        cards[index].isFlipped = true
        flippedCards.append(index)
        
        // Если перевернуто 2 карточки, проверяем совпадение
        if flippedCards.count == 2 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                checkMatch()
            }
        }
    }
    
    private func checkMatch() {
        let firstIndex = flippedCards[0]
        let secondIndex = flippedCards[1]
        
        // Сравниваем карточки по индексу картинки
        if cards[firstIndex].imageIndex == cards[secondIndex].imageIndex {
            // Совпадение найдено
            cards[firstIndex].isMatched = true
            cards[secondIndex].isMatched = true
            matchedPairs += 1
            
            // Проверяем, все ли карточки найдены
            if matchedPairs == totalPairs {
                // Ставим таймер на паузу
                stopTimer()
                // Показываем экран "THE TOWER IS BUILT!"
                showTowerBuilt = true
            }
        } else {
            // Не совпали - переворачиваем обратно
            cards[firstIndex].isFlipped = false
            cards[secondIndex].isFlipped = false
        }
        
        flippedCards = []
    }
    
    private func resetGame() {
        stopTimer()
        timeRemaining = 120
        points = 0
        setupGame()
    }
}

struct CardView: View {
    let card: Card
    
    var body: some View {
        ZStack {
            if card.isFlipped || card.isMatched {
                Image(card.imageResource)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Image(.cardClose)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .frame(height: 80)
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}

#Preview {
    NavigationView {
        BuildMatchView()
    }
}
