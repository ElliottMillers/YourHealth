//
//  HomeView.swift
//  YourHealth
//
//  Created by Rostyslav Mykhal on 4/8/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Image("DarkThemeBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        Text("TUESDAY, APR 15")
                            .font(.caption)
                            .fontWeight(.medium)
                            .padding(.leading)
                            .padding(.top, 60)
                            .foregroundStyle(Color.glassTextPrimary)

                        Text("Welcome")
                            .font(.largeTitle)
                            .padding(.horizontal)
                            .padding(.bottom, 30)
                            .foregroundStyle(Color.glassTextPrimary)

                        HStack(alignment: .center) {
                            ActivityRingsInfoView()

                            Spacer() 

                            // Права частина з кільцем
                            ActivityRingsView(viewModel: viewModel)
                                .frame(width: 160, height: 240) //  Обов'язково
                                .alignmentGuide(.center as HorizontalAlignment) { d in d[.trailing] }
                                .padding(.trailing, 10)
                        }
                        .padding(.horizontal, 28)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.ultraThinMaterial)
                                .background(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.white.opacity(0.2) as Color, lineWidth: 1)
                                )
                                .shadow(radius: 10)
                        )
                        .padding(.horizontal)

                        HStack {
                            Text("Fitness activity")
                                .font(.title2)
                                .foregroundStyle(Color.glassTextPrimary)
                            Spacer()
                            Button {
                                print("show more button pressed")
                            } label: {
                                Text("Show more")
                                    .font(.system(size: 16, weight: .medium))
                                    .padding()
                                    .foregroundStyle(Color.glassTextPrimary)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(.ultraThinMaterial)
                                    )
                            }
                            .padding(.top, 10)
                        }
                        .padding(.horizontal)

                        LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 2)) {
                            ForEach(viewModel.mockData, id: \.id) { activityViewModel in
                                ActivityCardView(viewModel: activityViewModel)
                            }
                        }
                        .padding(.horizontal)

                        HStack {
                            Text("Recent workouts")
                                .font(.title2)
                                .foregroundStyle(Color.glassTextPrimary)

                            Spacer()
                            NavigationLink {
                                EmptyView()
                            } label: {
                                Text("Show more > ")
                                    .font(.system(size: 16, weight: .medium))
                                    .padding()
                                    .foregroundStyle(Color.glassTextPrimary)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(.ultraThinMaterial)
                                    )
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 10)

                        LazyVStack {
                            ForEach(viewModel.mockWorkout, id: \.id) { workout in
                                WorkoutCardView(viewModel: workout)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
