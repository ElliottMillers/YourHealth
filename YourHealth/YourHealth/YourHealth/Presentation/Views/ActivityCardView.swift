//
//  ActivityCardView.swift
//  YourHealth
//
//  Created by Rostyslav Mykhal on 4/15/25.
//

import SwiftUI



struct ActivityCardView: View {

    @State var viewModel: ActivityViewModel
    
    var body: some View {
        
        VStack{
            HStack(alignment: .top){
                VStack(alignment: .leading, spacing: 8){
                    Text(viewModel.title)
                        .foregroundStyle(Color.glassTextPrimary)
                    Text(viewModel.subTitle)
                        .foregroundStyle(Color.glassTextPrimary)
                }
                Spacer()
                
                Image(systemName: viewModel.image)
                    .foregroundStyle(Color.green)
            }
            Text(viewModel.amount)
                .font(.title)
                .bold()
                .padding()
                .foregroundStyle(Color.glassTextPrimary)
        }
        .padding()
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
    ActivityCardView(viewModel: ActivityViewModel(id: 0, title: "Today steps", subTitle: "Goal 12,000", image: "figure.walk", tintColor: .green, amount: "9123"))
}
