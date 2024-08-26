//
//  Model.swift
//  HydrationApp
//
//  Created by Ionel, Lavinia on 06.08.2024.
//

import Foundation



struct Container: Identifiable {
    let id = UUID()
    var size: Double
    var unit: Unit
}


struct HydrationEntry: Identifiable, Codable {
    let id: UUID
    let date: Date
    let amount: Double
}
