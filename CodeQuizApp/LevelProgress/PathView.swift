//
//  PathView.swift
//  CodeQuizApp
//
//  Created by SHUAA on 28.12.2024.
//

import SwiftUI

struct PathView: View {
    private struct QuadCurve {
        let startPoint: CGPoint
        let controlPoint: CGPoint
        let endPoint: CGPoint
    }
    private let id : Int
    private let selectedLevel: Int
    private let progress: CGFloat
    private let quadCurve: QuadCurve
    private var pathMarksLocations: [CGPoint] = []
    
    init(id: Int, selectedLevel: Int, progress: CGFloat) {
        self.id = id
        self.selectedLevel = selectedLevel
        self.progress = progress
        
        let curves : [QuadCurve] = [
            QuadCurve(startPoint: CGPoint(x: -15, y: 40), controlPoint: CGPoint(x: -90, y: 60), endPoint: CGPoint(x: -70, y: 135)),
            QuadCurve(startPoint: CGPoint(x: -60, y: 90), controlPoint: CGPoint(x: -70, y: 160), endPoint: CGPoint(x: 10, y: 180)),
            QuadCurve(startPoint: CGPoint(x: 120, y: 40), controlPoint: CGPoint(x: 200, y: 100), endPoint: CGPoint(x: 145, y: 180)),
            QuadCurve(startPoint: CGPoint(x: 35, y: 40), controlPoint: CGPoint(x: -30, y: 65), endPoint: CGPoint(x: -10, y: 135)),
            QuadCurve(startPoint: CGPoint(x: 45, y: 40), controlPoint: CGPoint(x: 100, y: 75), endPoint: CGPoint(x: 100, y: 135)),
            QuadCurve(startPoint: CGPoint(x: 135, y: 60), controlPoint: CGPoint(x: 180, y: 140), endPoint: CGPoint(x: 90, y: 180))
        ]
        self.quadCurve = curves[id % 6]
        
        pathMarksLocations = [
            quadCurve.startPoint,
            getCenterPoint(startPoint: quadCurve.startPoint, controlPoint: CGPoint(x: (quadCurve.startPoint.x + quadCurve.controlPoint.x) / 2, y: (quadCurve.startPoint.y + quadCurve.controlPoint.y) / 2), endPoint: getCenterPoint(startPoint: quadCurve.startPoint, controlPoint: quadCurve.controlPoint, endPoint: quadCurve.endPoint)),
            getCenterPoint(startPoint: quadCurve.startPoint, controlPoint: quadCurve.controlPoint, endPoint: quadCurve.endPoint),
            getCenterPoint(startPoint: getCenterPoint(startPoint: quadCurve.startPoint, controlPoint: quadCurve.controlPoint, endPoint: quadCurve.endPoint), controlPoint: CGPoint(x: (quadCurve.endPoint.x + quadCurve.controlPoint.x) / 2, y: (quadCurve.endPoint.y + quadCurve.controlPoint.y) / 2), endPoint: quadCurve.endPoint), quadCurve.endPoint
        ]
        
    }
    var body: some View {
        ZStack{
            ForEach(0..<5) { number in
                Circle()
                    .frame(width: 10, height: 10)
                    .position(pathMarksLocations[number])
                    .foregroundStyle(selectedLevel > id ? .indigo : selectedLevel < id ? .gray.opacity(0.3) : CGFloat(number + 1 ) / 5.0 > progress ? .primary : .indigo)
            }
        }
    }
    
    private func getCenterPoint(startPoint: CGPoint, controlPoint: CGPoint,endPoint: CGPoint) -> CGPoint{
        CGPoint(x: (startPoint.x + endPoint.x + 2 * controlPoint.x) / 4,
                y: (startPoint.y + endPoint.y + 2 * controlPoint.y) / 4)
    }
}
