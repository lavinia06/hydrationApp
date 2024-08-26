//
//  DailyGoalVM.swift
//  HydrationApp
//
//  Created by Ionel, Lavinia on 16.08.2024.
//

import SwiftUI


class DailyGoalVM: ObservableObject, SettingsViewModel {
    @Published var model: DailyGoalModel
    @ObservedObject var unitManager = UnitManager.shared

    var goal: Int {
        get {model.dailyGoal}
        set {
            model.dailyGoal = newValue
            saveDailyGoal()
        }
    }
    
    var selectedUnit: Unit {
        get {unitManager.selectedUnit}
        set {
            unitManager.selectedUnit = newValue
        }
    }
    
    init(model: DailyGoalModel) {
        self.model = model
        loadDailyGoal()
    }
    
    func secondWord(of unit: Unit) -> String {
        let words = unit.rawValue.split(separator: " ")
        return words.count > 1 ? String(words[1]) : ""
    }
    
    func saveDailyGoal() {
        UserDefaults.standard.set(model.dailyGoal, forKey: UserDefaults.Keys.dailyGoal)
    }
    
    func loadDailyGoal() {
        if let savedGoal = UserDefaults.standard.value(forKey: UserDefaults.Keys.dailyGoal) as? Int {
            model.dailyGoal = savedGoal
        }
    }
}
