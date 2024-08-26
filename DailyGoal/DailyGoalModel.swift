//
//  DailyGoalModel.swift
//  HydrationApp
//
//  Created by Ionel, Lavinia on 16.08.2024.
//

import Foundation

enum Unit: String, CaseIterable {
    case ml = "mililiters (ml)"
    case oz = "ounces (oz)"
}

struct DailyGoalModel {
    var dailyGoal: Int
    var selectedUnit: Unit
}
