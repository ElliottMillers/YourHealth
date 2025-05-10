//
//  HealthTabView.swift
//  YourHealth
//
//  Created by Rostyslav Mykhal on 4/8/25.
//

import SwiftUI

struct HealthTabView: View {
    @State var selectedTab = "Home"
    
    init() {
        let appearence = UITabBarAppearance()
        appearence.configureWithOpaqueBackground()
        appearence.stackedLayoutAppearance.selected.iconColor = .green
        appearence.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green]
        UITabBar.appearance().scrollEdgeAppearance = appearence
    }
    
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView()
                .tag("home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                    
                }
            LeaderboardView()
                .tag("")
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Charts")
                }
        }
    }
}

#Preview {
    HealthTabView()
}
