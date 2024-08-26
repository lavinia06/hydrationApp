//
//  HomeHeaderView.swift
//  HydrationApp
//
//  Created by Ionel, Lavinia on 02.08.2024.
//

import SwiftUI


struct HomeHeaderView: View{
    
    @ObservedObject var vm: HomeViewModel
    @ObservedObject var dailyVM: DailyGoalVM
    @ObservedObject var containerVM: ContainerViewModel
    
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Today's progress")
                    .padding([.top, .leading])
                    .foregroundColor(.white)
                Spacer()
                NavigationLink(destination: SettingsViewContent(home_vm: vm, daily_vm: dailyVM, container_vm: containerVM)
                    .transition(.move(edge: .trailing))){
                        Image("Settings")
                            .font(.system(size: 30))
                            .frame(width: 30, height: 30)
                            .padding([.top, .leading])
                    }
            }
            .padding(.leading, 30)
            ProgressView(value: 1.0, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle())
                .tint(Color(hex: "40F589"))
                .frame(height: 0.5)
        }
        .background(.black)
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        var rgb: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
