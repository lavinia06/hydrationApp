//
//  ContainerViewModel.swift
//  HydrationApp
//
//  Created by Ionel, Lavinia on 19.08.2024.
//

import SwiftUI

class ContainerViewModel: ObservableObject, SettingsViewModel {
    @Published var model: ContainerModel
    
    var capacity2: Int {
        get{model.capacity2}
        set{
            model.capacity2 = newValue
            saveCapacity(at: 2)
        }
    }
    
    var capacity3: Int {
        get{model.capacity3}
        set{
            model.capacity3 = newValue
            saveCapacity(at: 3)
        }
    }
    
    var capacity1: Int {
        get{model.capacity1}
        set{
            model.capacity1 = newValue
            saveCapacity(at: 1)
        }
    }
    
    init(model: ContainerModel) {
        self.model = model
        loadCapacity(at: 1)
        loadCapacity(at: 2)
        loadCapacity(at: 3)
    }

    func secondWord(of unit: Unit) -> String {
        let words = unit.rawValue.split(separator: " ")
        return words.count > 1 ? String(words[1]) : ""
    }
    
    
    func saveCapacity(at index: Int) {
        switch index {
        case 1:
            UserDefaults.standard.set(model.capacity1, forKey: UserDefaults.Keys.capacity1)
        case 2:
            UserDefaults.standard.set(model.capacity2, forKey: UserDefaults.Keys.capacity2)
        case 3:
            UserDefaults.standard.set(model.capacity3, forKey: UserDefaults.Keys.capacity3)
        default:
            print("Invalid index. Please use 1, 2, or 3.")
        }
    }

    func loadCapacity(at index: Int) {
        switch index {
        case 1:
            if let savedCapacity1 = UserDefaults.standard.value(forKey: UserDefaults.Keys.capacity1) as? Int {
                model.capacity1 = savedCapacity1
            }
        case 2:
            if let savedCapacity2 = UserDefaults.standard.value(forKey: UserDefaults.Keys.capacity2) as? Int {
                model.capacity2 = savedCapacity2
            }
        case 3:
            if let savedCapacity3 = UserDefaults.standard.value(forKey: UserDefaults.Keys.capacity3) as? Int {
                model.capacity3 = savedCapacity3
            }
        default:
            print("Invalid index. Use 1, 2, or 3.")
        }
    }
}
