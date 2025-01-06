//
//  Custom.swift
//  CodeQuizApp
//
//  Created by SHUAA on 28.12.2024.
//
//

import SwiftUI

struct CustomGameLevelView: View {
    let level: Level
    @State private var selectedAnswer: Int? = nil
    @State private var isCorrect: Bool? = nil
    @State private var isProcessing = false
    @State private var showAlert = false
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedLevel: Int
    @Binding var questionIndex: Int
    
    init(level: Level, selectedLevel: Binding<Int>, questionIndex: Binding<Int>) {
        self.level = level
        self._selectedLevel = selectedLevel
        self._questionIndex = questionIndex
    }
    
    var body: some View {
        VStack(spacing: 46) {
            Text(level.questions[questionIndex].question)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .frame(height: 150)
            
            VStack(spacing: 16) {
                ForEach(0..<level.questions[questionIndex].possibleAnswers.count, id: \.self) { number in
                    Text(level.questions[questionIndex].possibleAnswers[number])
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(
                            isCorrect == nil || selectedAnswer != number ?
                                Color(.systemGray6) :
                                (number == level.questions[questionIndex].answerIndex ? Color.green : Color.red),
                            in: .rect(cornerRadius: 12)
                        )
                        .onTapGesture {
                            if !isProcessing {
                                selectedAnswer = number
                                checkAnswer(number)
                            }
                        }
                        .foregroundStyle(selectedAnswer == number ? .white : .gray)
                }
            }
            .frame(height: 200)
            
            Spacer()
            
            Text("Level \(selectedLevel + 1)")
                .font(.title2)
                .foregroundColor(.purple)
                .padding(.bottom, 30)
                .padding(.horizontal)
            
            ProgressView(value: Double(questionIndex + 1), total: Double(level.questions.count))
                .progressViewStyle(LinearProgressViewStyle())
                .padding()
                .padding(.horizontal)
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle(getLevelTitle(level.id))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.white)
                            .font(.system(size: 11))
                            .minimumScaleFactor(0.1)
                            .frame(width: 30, height: 30)
                            .background(.indigo)
                            .clipShape(Circle())
                    }
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Text("\(questionIndex + 1)/\(level.questions.count)")
                    .font(.system(size: 11))
                    .lineLimit(1)
                    .scaledToFit()
                    .minimumScaleFactor(0.1)
                    .frame(width: 30, height: 30)
                    .background(.indigo)
                    .clipShape(Circle())
            }
        }
        .alert("Incorrect Answer", isPresented: $showAlert) {
            Button("Try Again", role: .cancel) {
                selectedAnswer = nil
            }
        } message: {
            Text("Your answer is incorrect. Please try again.")
        }
    }
    
    func checkAnswer(_ selected: Int) {
        isProcessing = true
        isCorrect = (selected == level.questions[questionIndex].answerIndex)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if isCorrect == true {
                questionIndex += 1
                if questionIndex == level.questions.count {
                    dismiss()
                    selectedLevel += 1
                    questionIndex = 0
                }
            } else {
                showAlert = true 
            }
            selectedAnswer = nil
            isCorrect = nil
            isProcessing = false
        }
    }
}

#Preview {
    NavigationView {
        CustomGameLevelView(level: Level(id: 0, questions: [Question(question: "What is the capital of France?", possibleAnswers: ["Paris", "London", "Berlin"], answerIndex: 0)]), selectedLevel: .constant(0), questionIndex: .constant(0))
    }
}

private func getLevelTitle(_ id: Int) -> String {
    let levelTitles = [
        "Programming Basics",
        "Decisions and Data Structures",
        "Compilation and Debugging",
        "Advanced Concepts",
        "Object-Oriented Programming (OOP)",
        "Practical Tools"
    ]
    return id >= 0 && id < levelTitles.count ? levelTitles[id] : "Unknown Level"
}
