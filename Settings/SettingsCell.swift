//
//  SettingsCell.swift
//  HydrationApp
//
//  Created by Ionel, Lavinia on 14.08.2024.
//

import SwiftUI


struct SettingsCell<Destination: View, VM: SettingsViewModel>: View where VM: ObservableObject {
    var title: String
    @Binding var selectedUnit: Unit
    var quantity: String?
    var destination: Destination 
    @ObservedObject var home_vm: VM
    
    
    var body: some View {
        NavigationLink(destination: destination){
            HStack{
                Text(title).foregroundColor(.white)
                Spacer()
                Text(quantity ?? "")
                    .foregroundColor(Color(hex: "7C7C7C"))
                Text(home_vm.secondWord(of: selectedUnit))
                    .foregroundColor(Color(hex: "7C7C7C"))
            }
            .padding(8)
        }
        .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
            return -viewDimensions.width
        }
        .listRowSeparatorTint(Color.white) //(hex: "7C7C7C"))
        .listRowBackground(Color(hex: "454545"))
    }
}
    
