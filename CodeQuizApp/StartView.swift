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

    var body: some View {
        NavigationView {
            VStack {
                
                Text("Quiz Game")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top, 50)
                Image(.book)
                    .resizable()
                    .frame(width: 200, height: 200)
                Spacer()
                
                Text("Challenge Begins! Choose the right answers and advance through the stages!")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
                    .multilineTextAlignment(.center)
                Spacer()
                NavigationLink(destination: ContentView())
                    {
                    Text("Start")
                            .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 130, height: 20)
                        .padding()
                        .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(
                                                LinearGradient(gradient: Gradient(colors: [gradientStartColor, gradientEndColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                                   ,
                                                lineWidth: 3
                                            )
                                    )
                        .scaleEffect(scale)
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
