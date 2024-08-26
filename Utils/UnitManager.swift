//
//  UnitManager.swift
//  HydrationApp
//
//  Created by Ionel, Lavinia on 22.08.2024.
//

import SwiftUI


class UnitManager: ObservableObject {
    static let shared = UnitManager()
    
    @Published var selectedUnit: Unit {
        didSet {
            saveSelectedUnit()
        }
    }
    
    private init() {
        self.selectedUnit = .ml
        self.selectedUnit = loadSelectedUnit()
    }
    
    private func saveSelectedUnit() {
        UserDefaults.standard.set(selectedUnit.rawValue, forKey: UserDefaults.Keys.selectedUnit)
    }
    
    private func loadSelectedUnit() -> Unit {
        if let savedUnit = UserDefaults.standard.string(forKey: UserDefaults.Keys.selectedUnit),
           let unit = Unit(rawValue: savedUnit) {
            return unit
        }
        return .ml
    }
}
