//
//  ActivityRingsView.swift
//  YourHealth
//
//  Created by Rostyslav Mykhal on 5/10/25.
//
import SwiftUI

struct ActivityRingsView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
            let moveBinding = Binding<Double>(
                get: { Double(viewModel.moveCalories) },
                set: { viewModel.moveCalories = Double($0) }
                )
            let exerciseBinding = Binding<Double>(
                get: { Double(viewModel.exercise) },
                set: { viewModel.exercise = Int($0) }
            )

            let standBinding = Binding<Double>(
                get: { Double(viewModel.stand) },
                set: { viewModel.stand = Int($0) }
            )
            
            ZStack{
                ProgressCircleView(progress: moveBinding, goal: 600, color: Color.activityRed, size: 160)
                ProgressCircleView(progress: exerciseBinding, goal: 60, color: Color.activityGreen, size: 120)
                ProgressCircleView(progress: standBinding, goal: 12, color: Color.activityBlue, size: 80)
            }
            .padding()
    }
}

#Preview {
    ActivityRingsView(viewModel: HomeViewModel())
}
