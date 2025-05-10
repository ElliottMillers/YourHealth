//
//  HomeViewModel.swift
//  YourHealth
//
//  Created by Rostyslav Mykhal on 5/1/25.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    let healthManager = HealthManager.shared
    
    @Published var moveCalories: Double = 0.0
    @Published var exercise: Int = 0
    @Published var stand: Int = 0

    @Published var mockData = [
        ActivityViewModel(id: 0, title: "Today steps", subTitle: "Goal 12,000", image: "figure.walk", tintColor: .activityGreen, amount: "9123"),
        ActivityViewModel(id: 1, title: "Today steps", subTitle: "Goal 12,000", image: "figure.stand", tintColor: .activityRed, amount: "9123"),
        ActivityViewModel(id: 2, title: "Today steps", subTitle: "Goal 12,000", image: "figure.run", tintColor: .activityBlue, amount: "9123"),
        ActivityViewModel(id: 3, title: "Today steps", subTitle: "Goal 12,000", image: "bed.double.fill", tintColor: .sleepPurple, amount: "9123")
    ]

    @Published var mockWorkout = [
        WorkoutViewModel(id: 1, title: "Running", image: "figure.run", tintColor: .cyan, duration: "12 min", date: "1 May", calories: "235 kcal"),
        WorkoutViewModel(id: 2, title: "Gym", image: "figure.run", tintColor: .cyan, duration: "90 min", date: "2 May", calories: "873 kcal"),
        WorkoutViewModel(id: 3, title: "Biking", image: "figure.run", tintColor: .cyan, duration: "200 min", date: "3 May", calories: "1201 kcal"),
        WorkoutViewModel(id: 4, title: "Running", image: "figure.run", tintColor: .cyan, duration: "15 min", date: "4 May", calories: "253 kcal")
    ]
    
    
    init() {
        Task {
            do {
                try await healthManager.requestHealthKitAccess()
                fetchTodayCalories()
                fetchTodayStandHours()
                fetchTodayExerciseTime()
                healthManager.fetchTodayExerciseTime { result in
                    switch result {
                    case .success(let exercise):
                        DispatchQueue.main.async {
                            self.exercise = Int(exercise)
                        }
                    case .failure(let error):
                        print("❌ Exercise error:", error.localizedDescription)
                    }
                }

            } catch {
                print("❌ HealthKit access error:", error.localizedDescription)
            }
        }
    }
    
    func fetchTodayCalories() {
        healthManager.fetchTodayBurnedCalories { result in
            switch result {
            case .success(let calories):
                DispatchQueue.main.async {
                    self.moveCalories = Double(calories)
                }
            case .failure(let error):
                print("❌ Calories error:", error.localizedDescription)
            }
        }
    }
    
    func fetchTodayExerciseTime() {
        
    }
    
    func fetchTodayStandHours() {
        healthManager.fetchTodayStandHours { result in
            switch result {
            case .success(let hours):
                DispatchQueue.main.async {
                    self.stand = Int(hours)
                }
            case .failure(let error):
                print("❌ Stand error:", error.localizedDescription)
            }
        }
    }
}
