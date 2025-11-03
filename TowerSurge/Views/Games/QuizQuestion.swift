//
//  QuizQuestion.swift
//  TowerSurge
//
//  Created by Роман Главацкий on 31.10.2025.
//

import Foundation

struct QuizQuestion {
    let question: String
    let options: [String]
    let correctAnswer: Int // Индекс правильного ответа (0, 1, или 2)
}

enum QuizLevel: String, CaseIterable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    
    var image: ImageResource{
        switch self {
            
        case .easy:
            return .easyLevel
        case .medium:
            return .mediumLevel
        case .hard:
            return .hardLevel
        }
    }
}

struct QuizData {
    static let easyQuestions: [QuizQuestion] = [
        QuizQuestion(question: "Where is Burj Khalifa?", options: ["Tokyo", "Dubai", "London"], correctAnswer: 1),
        QuizQuestion(question: "Where is Tokyo Tower?", options: ["Japan", "China", "Korea"], correctAnswer: 0),
        QuizQuestion(question: "Where is CN Tower?", options: ["New York", "Toronto", "Paris"], correctAnswer: 1),
        QuizQuestion(question: "What are towers made of?", options: ["Wood", "Steel", "Cloth"], correctAnswer: 1),
        QuizQuestion(question: "What is under a tower?", options: ["Spire", "Foundation", "Balcony"], correctAnswer: 1),
        QuizQuestion(question: "Who designs towers?", options: ["Architect", "Pilot", "Doctor"], correctAnswer: 0),
        QuizQuestion(question: "What keeps a tower standing?", options: ["Foundation", "Windows", "Roof"], correctAnswer: 0),
        QuizQuestion(question: "What is on top of a tower?", options: ["Spire", "Lift", "Shop"], correctAnswer: 0),
        QuizQuestion(question: "What is concrete made from?", options: ["Clay", "Cement", "Ice"], correctAnswer: 1),
        QuizQuestion(question: "Where is the viewing deck?", options: ["On top", "Below", "Inside"], correctAnswer: 0)
    ]
    
    static let mediumQuestions: [QuizQuestion] = [
        QuizQuestion(question: "Which tower is the tallest?", options: ["Burj Khalifa", "Tokyo Tower", "CN Tower"], correctAnswer: 0),
        QuizQuestion(question: "Tokyo Tower looks like which one?", options: ["Eiffel Tower", "Big Ben", "Kremlin"], correctAnswer: 0),
        QuizQuestion(question: "What helps in strong wind?", options: ["Heavy bottom", "Flat roof", "Narrow door"], correctAnswer: 0),
        QuizQuestion(question: "Who builds elevators?", options: ["Engineer", "Chef", "Driver"], correctAnswer: 0),
        QuizQuestion(question: "When was Burj Khalifa finished?", options: ["2005", "2010", "2015"], correctAnswer: 1),
        QuizQuestion(question: "What's inside tall towers?", options: ["Fields", "Elevators", "Boats"], correctAnswer: 1),
        QuizQuestion(question: "What makes buildings strong?", options: ["Frame", "Lamps", "Paint"], correctAnswer: 0),
        QuizQuestion(question: "What does the wind do?", options: ["Paints", "Shakes", "Heats"], correctAnswer: 1),
        QuizQuestion(question: "Where is the antenna?", options: ["On the spire", "Below", "Inside"], correctAnswer: 0),
        QuizQuestion(question: "What shape is CN Tower?", options: ["Round", "Square", "Triangle"], correctAnswer: 0)
    ]
    
    static let hardQuestions: [QuizQuestion] = [
        QuizQuestion(question: "What makes towers stable?", options: ["Center of gravity", "Light", "Paint"], correctAnswer: 0),
        QuizQuestion(question: "Why does a tower need a foundation?", options: ["To hold weight", "For looks", "To hide doors"], correctAnswer: 0),
        QuizQuestion(question: "What does a damper do?", options: ["Stops shaking", "Lights up", "Makes noise"], correctAnswer: 0),
        QuizQuestion(question: "Which material is heavy?", options: ["Concrete", "Plastic", "Paper"], correctAnswer: 0),
        QuizQuestion(question: "What's in the \"core\" of a tower?", options: ["Elevators", "Spire", "Balcony"], correctAnswer: 0),
        QuizQuestion(question: "What helps in earthquakes?", options: ["Flexibility", "Hardness", "Weight"], correctAnswer: 0),
        QuizQuestion(question: "What means \"aerodynamic\"?", options: ["Wind-friendly", "Bright", "Loud"], correctAnswer: 0),
        QuizQuestion(question: "Why is the spire thin?", options: ["Less wind", "Prettier", "Cheaper"], correctAnswer: 0),
        QuizQuestion(question: "Which tower is for TV?", options: ["Tokyo Tower", "CN Tower", "Burj Khalifa"], correctAnswer: 1),
        QuizQuestion(question: "Why don't towers fall down?", options: ["Strong foundation", "Wall color", "Small windows"], correctAnswer: 0)
    ]
    
    static func getQuestions(for level: QuizLevel) -> [QuizQuestion] {
        switch level {
        case .easy:
            return easyQuestions
        case .medium:
            return mediumQuestions
        case .hard:
            return hardQuestions
        }
    }
}


