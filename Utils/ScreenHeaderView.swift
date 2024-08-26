//
//  ScreenHeaderView.swift
//  HydrationApp
//
//  Created by Ionel, Lavinia on 12.08.2024.
//

import SwiftUI

struct ScreenHeaderView: View {
    @Environment(\.presentationMode) var presentationMode
    var title: String
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("Back")
                        .font(.system(size: 30))
                        .frame(width: 30, height: 30)
                        .padding([.top, .leading])
                }
                Spacer()
                Text(title)
                    .padding([.top, .leading])
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.trailing, 40)
            ProgressView(value: 1.0, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle())
                .tint(Color(hex: "40F589"))
                .frame(height: 0.5)
        }
        .background(Color.black)
        .navigationBarBackButtonHidden(true)
    }
}


struct ScreenHeaderView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView{
            ScreenHeaderView(title: "title")
                .navigationBarHidden(true)
        }
    }
}

