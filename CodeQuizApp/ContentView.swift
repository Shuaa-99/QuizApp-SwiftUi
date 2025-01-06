//
//  ContentView.swift
//  CodeQuizApp
//
//  Created by SHUAA on 28.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedLevel = 0
    @State private var questionIndex = 0
    let levels: [Level] = [
        Level(id: 0, questions: [
            Question(question: "What is a variable in programming?", possibleAnswers: ["A fixed value", "A container for data", "An operator"], answerIndex: 1),
            Question(question: "What does a loop do in programming?", possibleAnswers: ["Executes code repeatedly", "Stops the program", "Defines a function"], answerIndex: 0),
            Question(question: "What is the purpose of a function?", possibleAnswers: ["Store data", "Encapsulate reusable code", "Handle errors"], answerIndex: 1)
        ]),
        Level(id: 1, questions: [
            Question(question: "What is an if statement used for?", possibleAnswers: ["To repeat code", "To make decisions", "To define variables"], answerIndex: 1),
            Question(question: "What is an array?", possibleAnswers: ["A collection of elements", "A single variable", "A type of loop"], answerIndex: 0),
            Question(question: "What is a data type?", possibleAnswers: ["The kind of data a variable holds", "The size of the program", "A collection of variables"], answerIndex: 0)
        ]),
        Level(id: 2, questions: [
            Question(question: "What does a compiler do?", possibleAnswers: ["Executes code", "Converts code to machine-readable format", "Checks for errors only"], answerIndex: 1),
            Question(question: "What is a constant in programming?", possibleAnswers: ["A variable that cannot change", "A function that repeats", "An error in code"], answerIndex: 0),
            Question(question: "What is debugging?", possibleAnswers: ["Writing code", "Fixing errors in code", "Optimizing performance"], answerIndex: 1)
        ]),
        Level(id: 3, questions: [
            Question(question: "What is recursion in programming?", possibleAnswers: ["A function calling itself", "A loop within a loop", "An error in a function"], answerIndex: 0),
            Question(question: "What is the purpose of an algorithm?", possibleAnswers: ["A step-by-step solution to a problem", "A tool to debug code", "A type of variable"], answerIndex: 0),
            Question(question: "What does 'syntax' mean in programming?", possibleAnswers: ["Logical errors", "Rules for writing code", "Steps to run the program"], answerIndex: 1)
        ]),
        Level(id: 4, questions: [
            Question(question: "What is object-oriented programming?", possibleAnswers: ["Programming with loops", "A paradigm based on objects and classes", "A way to write functions"], answerIndex: 1),
            Question(question: "What is inheritance in OOP?", possibleAnswers: ["A class using another class's properties", "A type of loop", "A function inside a class"], answerIndex: 0),
            Question(question: "What is an interface in programming?", possibleAnswers: ["A user interface", "A contract for classes to follow", "A type of loop"], answerIndex: 1)
        ]),
        Level(id: 5, questions: [
            Question(question: "What is an IDE?", possibleAnswers: ["An editor to write and debug code", "A type of variable", "A compiler"], answerIndex: 0),
            Question(question: "What is an API?", possibleAnswers: ["A set of tools for building software", "A loop in programming", "A type of error"], answerIndex: 0),
            Question(question: "What is the purpose of version control?", possibleAnswers: ["Manage code changes", "Compile code", "Store data"], answerIndex: 0)
        ])
    ]

    var body: some View {
        NavigationView{
            LevelProgressView(levels: levels, selectedLevel: $selectedLevel, questionIndex: $questionIndex)
                .navigationBarTitle("Progress Map")
        }
        .navigationBarBackButtonHidden(true)
        .tint(.indigo)
    }
}

#Preview {
    ContentView()
}
