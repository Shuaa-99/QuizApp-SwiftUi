//
//  LevelModel.swift
//  CodeQuizApp
//
//  Created by SHUAA on 28.12.2024.
//

import SwiftUI

struct Level: Identifiable {
    let id: Int
    let questions: [Question]
    static func == (lhs: Level, rhs: Level) -> Bool {
        lhs.id == rhs.id }
    
}
struct Question {
    let question: String
    let possibleAnswers: [String]
    let answerIndex: Int
}
