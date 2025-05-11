//
//  ActivityRingsInfoView.swift
//  YourHealth
//
//  Created by Rostyslav Mykhal on 5/11/25.
//

import SwiftUI

struct ActivityRingsInfoView: View {
    let viewModel = HomeViewModel()
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 2) {
                Text("Move")
                    
                Text("\(Int(viewModel.moveCalories))")
                    .foregroundStyle(Color.activityRed)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text("Exercise")
                
                Text("\(Int(viewModel.exercise))")
                    .foregroundStyle(Color.activityGreen)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text("Stand")
                
                Text("\(Int(viewModel.stand))")
                    .foregroundStyle(Color.activityBlue)
            }
        }
        .font(.title2)
        .bold()
        .foregroundStyle(Color.glassTextPrimary)
    }
}

#Preview {
    ActivityRingsInfoView()
}
