//
//  Constants.swift
//  FurnitureApp
//
//  Created by Vivek Limbani   
//

import SwiftUI
import UIKit


// MARK: - Wavy Underline Shape
struct WavyUnderlineShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height * 0.2))
        
        path.addCurve(
            to: CGPoint(x: rect.width, y: rect.height * 0.4),
            control1: CGPoint(x: rect.width * 0.3, y: rect.height * 1.2),
            control2: CGPoint(x: rect.width * 0.7, y: -rect.height * 0.4)
        )
        
        return path
    }
}



// MARK: - Shapes
struct HeaderBackgroundShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height - 60))
        
        path.addCurve(
            to: CGPoint(x: 0, y: rect.height + 5),
            control1: CGPoint(x: rect.width * 0.7, y: rect.height - 60),
            control2: CGPoint(x: rect.width * 0.3, y: rect.height + 15)
        )
        
        path.closeSubpath()
        return path
    }
}


// MARK: - Bottom Wave Shape
struct BottomWaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 30))
        
        path.addCurve(
            to: CGPoint(x: rect.width, y: 25),
            control1: CGPoint(x: rect.width * 0.3, y: -15),
            control2: CGPoint(x: rect.width * 0.7, y: 70)
        )
        
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        return path
    }
}


