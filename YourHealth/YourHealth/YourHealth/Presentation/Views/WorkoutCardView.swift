//
//  WorkoutCardView.swift
//  YourHealth
//
//  Created by Rostyslav Mykhal on 5/1/25.
//

import SwiftUI

struct WorkoutCardView: View {
    @State var viewModel: WorkoutViewModel
    var body: some View {
        HStack {
            Image(systemName: viewModel.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .foregroundStyle(Color.activityGreen)
                .padding()

            
            VStack(spacing: 16) {
                HStack {
                    Text(viewModel.title)
                        .font(.title3)
                        .bold()
                        .foregroundStyle(Color.glassTextPrimary)
                    Spacer()
                    Text(viewModel.duration)
                        .foregroundStyle(Color.glassTextPrimary)
                    
                }
                HStack {
                    Text(viewModel.date)
                        .foregroundStyle(Color.glassTextPrimary)
                    Spacer()
                    Text(viewModel.calories)
                        .foregroundStyle(Color.glassTextPrimary)
                }
            }
            
        }
        .padding(.horizontal)
        .background(
            // 💡 Glassmorphism Effect
            RoundedRectangle(cornerRadius: 25)
                .fill(.ultraThinMaterial)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
                .shadow(radius: 10)
        )
    }
}

#Preview {
    WorkoutCardView(viewModel: WorkoutViewModel(id: 1, title: "Running", image: "figure.run", tintColor: .cyan, duration: "51 min", date: "8 May", calories: "235 kcal"))
}
