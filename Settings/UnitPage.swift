//
//  UnitPage.swift
//  HydrationApp
//
//  Created by Ionel, Lavinia on 12.08.2024.
//

import SwiftUI


struct UnitPage: View {
    @ObservedObject var home_vm: HomeViewModel
    @ObservedObject var unitManager = UnitManager.shared

    
    var body: some View{
        VStack(spacing: 0) {
            ScreenHeaderView( title:"Units")
                .padding(.top, 0)
            VStack(spacing: 0) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color(hex: "7C7C7C"))
                List(Unit.allCases, id: \.self){ option in
                    Button(action: {
                        unitManager.selectedUnit = option
                    }){
                        HStack {
                            Text(option.rawValue)
                                .foregroundColor(.white)
                            Spacer()
                            if unitManager.selectedUnit == option {
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color(hex: "40F589"))
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "454545"))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .listRowSeparatorTint(Color(hex: "7C7C7C"))
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(PlainListStyle())
            }
            .padding(.top, 65)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.black)
    }
}
 



