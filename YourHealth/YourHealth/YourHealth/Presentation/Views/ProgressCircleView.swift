//
//  CircleView.swift
//  YourHealth
//
//  Created by Rostyslav Mykhal on 4/9/25.
//

import SwiftUI

struct ProgressCircleView: View {
    @Binding var progress: Double
    var goal: Double
    var color: Color
    private let width: CGFloat = 20
    var size: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.27), lineWidth: width)
            
            Circle()
                .trim(from: 0, to: CGFloat(progress) / CGFloat(goal))
                .stroke(color, style: StrokeStyle(lineWidth: width, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .shadow(radius: 5)
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    ProgressCircleView(progress: .constant(300.0), goal: 600, color: .red, size: 100)
}
