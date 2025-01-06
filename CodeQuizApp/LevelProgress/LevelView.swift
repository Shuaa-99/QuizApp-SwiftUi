//
//  LevelView.swift
//  CodeQuizApp
//
//  Created by SHUAA on 28.12.2024.
//

import SwiftUI

struct LevelView: View {
    
    let level: Level
    
    @Binding var selectedLevel: Int
    @Binding var questionIndex: Int
    
    let isLast: Bool
    let offset: CGFloat
    
    init (level: Level, selectedLevel: Binding<Int>, questionIndex: Binding<Int>, isLast: Bool) {
        self.level = level
        self._selectedLevel = selectedLevel
        self._questionIndex = questionIndex
        self.isLast = isLast
        
        let offsets: [CGFloat] = [0, -100, 25, 50, -50, 50]
        offset = offsets[level.id % 6]
        
    }
    @State private var gradientStartColor: Color = Color.blue
    @State private var gradientEndColor: Color = Color.purple
    var body: some View {
        VStack{
            ZStack{
            ZStack{
                if selectedLevel >=  level.id {
                    Circle()
                        .stroke(.gray.opacity(0.3),lineWidth: 7.5)
                    Circle()
                        .trim(from: 0.0, to: selectedLevel > level.id ? 1.0: CGFloat(questionIndex) / CGFloat(level.questions.count))
                        .stroke(style: .init(lineWidth: 7.5, lineCap: .round))
                        .rotationEffect(.degrees(270))
                        .foregroundStyle(.indigo)
                }
            }
            .frame(width: 80,height: 80)
                NavigationLink{
                    CustomGameLevelView(level: level, selectedLevel: $selectedLevel, questionIndex: $questionIndex)
                } label: {
                Image(systemName: selectedLevel >= level.id ? "star.fill" : "lock.fill")
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(width:25, height:25)
                    .foregroundStyle(selectedLevel > level.id ? .indigo : selectedLevel < level.id ? .gray : .purple)
            }
            .disabled(selectedLevel != level.id)
            .frame(width: 60 , height: 60)
            .background(selectedLevel >= level.id ? .white : .gray.opacity(0.3))
            .clipShape(.circle)
        }
        .offset(x: offset)
        .overlay{
            if !isLast {
                PathView(id: level.id, selectedLevel: selectedLevel, progress: CGFloat(questionIndex) / CGFloat(level.questions.count))
            }
        }
    }.frame(maxWidth: .infinity,minHeight: 150)
    }
}
#Preview {
    ContentView()
}
