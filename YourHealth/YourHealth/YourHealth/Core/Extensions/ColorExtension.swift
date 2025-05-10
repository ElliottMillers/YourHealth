//
//  ColorExtension.swift
//  YourHealth
//
//  Created by Rostyslav Mykhal on 4/15/25.
//
import Foundation
import SwiftUI

extension Color {
    
    // MARK: - Glassmorphism Backgrounds
    static let glassBackgroundLight = Color.white.opacity(0.5)
    static let glassBackgroundDark = Color.black.opacity(0.5)
    

    // MARK: - Apple Fitness & Health-Inspired Colors
    static let activityRed = Color(red: 255/255, green: 59/255, blue: 48/255)      // Active Energy
    static let activityGreen = Color(red: 76/255, green: 217/255, blue: 100/255)   // Exercise
    static let activityBlue = Color(red: 90/255, green: 200/255, blue: 250/255)    // Stand/Steps
    static let heartPink = Color(red: 255/255, green: 45/255, blue: 85/255)        // Heart Rate
    static let sleepPurple = Color(red: 88/255, green: 86/255, blue: 214/255)      // Sleep
    static let mindfulnessTeal = Color(red: 64/255, green: 200/255, blue: 224/255) // Mindfulness
    static let caloriesOrange = Color(red: 255/255, green: 149/255, blue: 0/255)   // Caloric Burn
    
    // MARK: - Custom text colors over blurred backgrounds
    static let glassTextPrimary = Color.white.opacity(0.85)
    static let glassTextSecondary = Color.white.opacity(0.6)
}

