//
//  HomeScreenViewModel.swift
//  HydrationApp
//
//  Created by Ionel, Lavinia on 02.08.2024.
//

import SwiftUI
import Combine


class HomeViewModel: ObservableObject, SettingsViewModel{
    @Published var isSettingsViewActive: Bool = false
    @Published var showUnitPage: Bool = false
    @Published var waterIntake: Int = 0
    @Published var fillLevel: CGFloat = 0.0
    private var dailyGoalModel: DailyGoalModel
    
    
    init(dailyGoalModel: DailyGoalModel) {
        self.dailyGoalModel = dailyGoalModel
    }
    
    var goal: Int {
        dailyGoalModel.dailyGoal
    }
    
    func addWater(amount: Int) {
        let newIntake = waterIntake + amount
        waterIntake = newIntake
        fillLevel = min(CGFloat(newIntake) / CGFloat(goal), 1.0)
    }
    
    func secondWord(of unit: Unit) -> String {
        let words = unit.rawValue.split(separator: " ")
        return words.count > 1 ? String(words[1]) : ""
    }
}
