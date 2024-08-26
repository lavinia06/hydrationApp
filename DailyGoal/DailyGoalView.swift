//
//  DailyGoalView.swift
//  HydrationApp
//
//  Created by Ionel, Lavinia on 16.08.2024.
//

import SwiftUI



struct DailyGoalView: View {
    @ObservedObject var viewModel: DailyGoalVM
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 0) {
            CancelSaveHeaderView(title: "Daily Goal", onSave: {
                presentationMode.wrappedValue.dismiss()
            })
            .padding(.top, 0)
            ZStack {
                Image("Image")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.bottom)
                VStack(spacing: 0) {
                    Text("Here you can set your hydration goal based on your preferred unit of measurement")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 90)
                        .padding(.top, 60)
                    Spacer(minLength: 100)
                    ZStack(alignment: .leading){
                        TextField("2000", value: $viewModel.goal, formatter: NumberFormatter())
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 200)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green, lineWidth: 4)
                            )
                            .keyboardType(.decimalPad)
                            .focusable(true)
                    }
                    Text(viewModel.selectedUnit.rawValue)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}






