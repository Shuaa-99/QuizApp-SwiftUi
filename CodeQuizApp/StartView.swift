//
//  StartView.swift
//  CodeQuizApp
//
//  Created by SHUAA on 3.1.2025.
//
//

import SwiftUI

struct StartView: View {
    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 1.0
    @State private var gradientStartColor: Color = Color.blue
    @State private var gradientEndColor: Color = Color.purple
    @State private var currentStage = 1
    @State private var bounce: Bool = false  // حالة لتتبع الحركة

    var body: some View {
        NavigationView {
            VStack {
                Text("Quiz Game")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.purple)
                    .padding(.top, 50)
                Image("lamp3D")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .animation(
                        Animation.easeInOut(duration: 2.5)
                            .repeatForever(autoreverses: true)
                    )
                    .onAppear {
                        bounce.toggle()
                    }
                
                Spacer()
                
                Text("You are about to start the challenge! Choose the correct answers and progress through the stages!")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
                    .multilineTextAlignment(.center)
                Spacer()
                NavigationLink(destination: ContentView())
                    {
                    Text("Start")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 150, height: 40)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [gradientStartColor, gradientEndColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .cornerRadius(15)
                        )
                        .scaleEffect(scale)
                        .shadow(radius: 15)
                }
                .animation(
                    Animation.easeInOut(duration: 1.5)
                        .repeatForever(autoreverses: true), value: scale
                )
                .onAppear {
                    scale = 1.1
                    opacity = 0.7
                    gradientStartColor = Color.blue
                    gradientEndColor = Color.purple
                }
                
                Spacer()
                
                
                
                Spacer()
            }
            .padding()
        }
    }
}

struct AnimatedButtonView_Previews: PreviewProvider {
    static var previews: some View {
       StartView()
    }
}
