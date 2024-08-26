//
//  Container1.swift
//  HydrationApp
//
//  Created by Ionel, Lavinia on 19.08.2024.
//

import SwiftUI



struct Container1View: View {
    @ObservedObject var containerViewModel: ContainerViewModel
    @State private var inputText: String = "2000"
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var unitManager = UnitManager.shared
    
    
    var body: some View {
        VStack(spacing: 0) {
            CancelSaveHeaderView(title: "Container 1", onSave: {
                presentationMode.wrappedValue.dismiss()
            })
            .padding(.top, 0)
            ZStack {
                Image("Image")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.bottom)
                
                VStack(spacing: 0) {
                    Text("Here you can specify your container size so it would be easier to enter your daily liquid intake.")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 90)
                        .padding(.top, 60)
                    
                    Spacer(minLength: 100)
                    ZStack(alignment: .leading) {
                        TextField(inputText, text: $inputText)
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
                            .onChange(of: inputText) { newValue in
                                let filteredValue = newValue.filter { "0123456789.".contains($0) }
                                inputText = filteredValue
                                
                                if let number = Int(filteredValue) {
                                    containerViewModel.capacity1 = number
                                }
                            }
                            .onAppear {
                                inputText = "\(containerViewModel.capacity1)"
                            }
                            .focusable(true)
                    }
                    Text(unitManager.selectedUnit.rawValue)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}
