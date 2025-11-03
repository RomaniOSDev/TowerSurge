//
//  QuizView.swift
//  TowerSurge
//
//  Created by Роман Главацкий on 31.10.2025.
//

import SwiftUI

struct QuizView: View {
    let level: QuizLevel
    @State private var questions: [QuizQuestion] = []
    @State private var currentQuestionIndex: Int = 0
    @State private var selectedAnswer: Int? = nil
    @State private var score: Int = 0
    @State private var showResult: Bool = false
    @State private var isAnswered: Bool = false
    
    var body: some View {
        ZStack {
            Image(.qizBack)
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 20) {
                if showResult {
                    resultView
                } else if !questions.isEmpty && currentQuestionIndex < questions.count {
                    quizContentView
                } else {
                    ProgressView()
                }
            }
            .padding()
            .navigationTitle("Level \(levelNumber) - \(level.rawValue)")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                loadQuestions()
            }
        }
    }
    
    private var levelNumber: Int {
        switch level {
        case .easy: return 1
        case .medium: return 2
        case .hard: return 3
        }
    }
    
    private var quizContentView: some View {
        VStack( spacing: 20) {
            // Прогресс
            QuestionCountView(count: currentQuestionIndex + 1, countMax: questions.count)
                .frame(width: 120, height: 50)
            
            
            ProgressView(value: Double(currentQuestionIndex + 1), total: Double(questions.count))
                .progressViewStyle(LinearProgressViewStyle())
            
            // Вопрос
            ZStack {
                Image(.countLabel)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(questions[currentQuestionIndex].question)
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
            }
            
            // Варианты ответов
            ForEach(0..<questions[currentQuestionIndex].options.count, id: \.self) { index in
                Button(action: {
                    if !isAnswered {
                        selectAnswer(index)
                    }
                }) {
                    ZStack(alignment: .leading){
                        Image(answerBackgroundColor(for: index))
                            .resizable()
                            .frame(width: 290, height: 110)
                        Text(questions[currentQuestionIndex].options[index])
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .padding(.horizontal, 30)
                            
                    }
                }
                .disabled(isAnswered)
            }
            
            Spacer()
        }
    }
    
    private var resultView: some View {
        ZStack(alignment: .bottom) {
            Image(getFloorImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(spacing: 30) {
                Text("Quiz completed!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                Text("\(score) из \(questions.count)")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.white)
                Spacer()
                
                NavigationLink(destination: TowerQuizView()) {
                    Image(.nextbut)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .padding()
        }
    }
    
    private func getFloorImage() -> ImageResource {
        let floorNumber: Int
        switch score {
        case 0...2:
            floorNumber = 1
        case 3...4:
            floorNumber = 2
        case 5...6:
            floorNumber = 3
        case 7...8:
            floorNumber = 4
        default: // 9 и больше
            floorNumber = 5
        }
        
        switch floorNumber {
        case 1:
            return .floor1
        case 2:
            return .floor2
        case 3:
            return .floor3
        case 4:
            return .floor4
        case 5:
            return .floor5
        default:
            return .floor1
        }
    }
    
    private func loadQuestions() {
        questions = QuizData.getQuestions(for: level)
    }
    
    private func selectAnswer(_ index: Int) {
        selectedAnswer = index
        isAnswered = true
        
        if index == questions[currentQuestionIndex].correctAnswer {
            score += 1
        }
        
        // Автоматический переход к следующему вопросу через 2 секунды
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            nextQuestion()
        }
    }
    
    private func nextQuestion() {
        if currentQuestionIndex + 1 < questions.count {
            currentQuestionIndex += 1
            selectedAnswer = nil
            isAnswered = false
        } else {
            showResult = true
        }
    }
    
    private func answerTextColor(for index: Int) -> Color {
        if !isAnswered {
            return .primary
        }
        
        if index == questions[currentQuestionIndex].correctAnswer {
            return .green
        } else if index == selectedAnswer {
            return .red
        } else {
            return .secondary
        }
    }
    
    private func answerBackgroundColor(for index: Int) -> ImageResource {
        if !isAnswered {
            return .answer
        }
        
        if index == questions[currentQuestionIndex].correctAnswer {
            return .answerGood
        } else if index == selectedAnswer {
            return .answerbad
        } else {
            return .answer
        }
    }
    
    private func answerBorderColor(for index: Int) -> Color {
        if !isAnswered {
            return selectedAnswer == index ? .blue : .clear
        }
        
        if index == questions[currentQuestionIndex].correctAnswer {
            return .green
        } else if index == selectedAnswer {
            return .red
        } else {
            return .clear
        }
    }
}

#Preview {
    NavigationView {
        QuizView(level: .easy)
    }
}


