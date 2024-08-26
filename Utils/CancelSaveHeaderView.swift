//
//  CancelSaveHeaderView.swift
//  HydrationApp
//
//  Created by Ionel, Lavinia on 21.08.2024.
//

import SwiftUI


struct CancelSaveHeaderView: View {
    var title: String
    var onSave: () -> Void
    var body: some View {
    @Environment(\.presentationMode) var presentationMode

        
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    Text ("Cancel")
                        .foregroundColor(.green)
                }
                Spacer()
                Text(title)
                    .padding([.top, .leading])
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                    onSave()
                }) {
                    Text("Save")
                        .foregroundColor(.green)
                }
            }
            .padding(.trailing, 16)
            ProgressView(value: 1.0, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle())
                .tint(Color(hex: "40F589"))
                .frame(height: 0.5)
        }
        .background(Color.black)
        .navigationBarBackButtonHidden(true)
    }
}


