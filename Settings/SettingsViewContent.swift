//
//  SettingsViewContent.swift
//  HydrationApp
//
//  Created by Ionel, Lavinia on 06.08.2024.
//

import SwiftUI


struct SettingsViewContent: View {
    @ObservedObject var home_vm: HomeViewModel
    @ObservedObject var daily_vm: DailyGoalVM
    @ObservedObject var container_vm: ContainerViewModel
    @ObservedObject var unitManager = UnitManager.shared
    
    
    var body: some View {
        
        VStack(spacing: 0) {
            ScreenHeaderView(title: "Settings")
                .padding(.top, 0)
            VStack(spacing: 0) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color(hex: "7C7C7C"))
                List {
                    Section {
                        SettingsCell(
                            title: "Units",
                            selectedUnit: $unitManager.selectedUnit,
                            quantity: nil,
                            destination: UnitPage(/*selectedUnit: $selectedUnit,*/ home_vm: home_vm),
                            home_vm: home_vm
                        )
                        SettingsCell(
                            title: "Daily Goal",
                            selectedUnit: $unitManager.selectedUnit,
                            quantity: "\(daily_vm.goal)",
                            destination: DailyGoalView(/*selectedUnit: $selectedUnit, */viewModel: daily_vm),
                            home_vm: daily_vm
                        )
                    }
                    Section {
                        Rectangle()
                            .fill(Color.black)
                    }
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                    Section(header: Text("Containers").foregroundColor(Color(hex: "454545"))) {
                        SettingsCell(
                            title: "Container 1",
                            selectedUnit: $unitManager.selectedUnit,
                            quantity: "\(container_vm.capacity1)",
                            destination: Container1View(/*selectedUnit: $selectedUnit, */containerViewModel: container_vm),
                            home_vm: home_vm
                        )
                        SettingsCell(
                            title: "Container 2",
                            selectedUnit: $unitManager.selectedUnit,
                            quantity: "\(container_vm.capacity2)",
                            destination: Container2View(/*selectedUnit: $selectedUnit,*/ viewModel: container_vm),
                            home_vm: home_vm
                        )
                        SettingsCell(
                            title: "Container 3",
                            selectedUnit: $unitManager.selectedUnit,
                            quantity: "\(container_vm.capacity3)",
                            destination: Container3View(/*selectedUnit: $selectedUnit,*/ viewModel: container_vm),
                            home_vm: home_vm
                        )
                    }
                    .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    Section(footer: FooterView()){
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
                .background(.black)
            }
            .background(.black)
            .padding(.top, 65)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .environment(\.colorScheme, .dark)
    }
}



protocol SettingsViewModel: ObservableObject {
    func secondWord(of unit: Unit) -> String
}
