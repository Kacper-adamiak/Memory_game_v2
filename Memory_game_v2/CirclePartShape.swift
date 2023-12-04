//
//  CirclePartShape.swift
//  Memory_game_v2
//
//  Created by student on 04/12/2023.
//

import SwiftUI
import CoreGraphics

struct CirclePartShape: Shape {
    
    var startAngle: Double = 0
    var endAngle: Double = 270
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height)/2
        path.move(to: center)
        path.addArc(center: center, radius: radius, startAngle: .degrees(startAngle), endAngle: .degrees(endAngle), clockwise: false)
        
        return path
    }
    
    
}

