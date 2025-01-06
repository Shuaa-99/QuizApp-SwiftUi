//
//  LevelProgressView.swift
//  CodeQuizApp
//
//  Created by SHUAA on 28.12.2024.
//
import SwiftUI
struct LevelProgressView: View {
    let levels: [Level]
    @Binding var selectedLevel: Int
    @Binding var questionIndex: Int
    var body: some View {
        ScrollView {
            VStack (spacing: 0) {
                ForEach (levels) { level in
                    LevelView (level: level, selectedLevel: $selectedLevel, questionIndex: $questionIndex,
                               isLast: level == levels.last ?? level)
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
