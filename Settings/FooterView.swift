//
//  Footer.swift
//  HydrationApp
//
//  Created by Ionel, Lavinia on 14.08.2024.
//

import SwiftUI


struct FooterView: View {
    var body: some View {
        Text("These containers will appear on your  ain screen so you can easily tap on them and track yout intake.")
            .foregroundColor(Color(hex: "454545"))
            .font(.system(size: 15, weight: .semibold, design: .default))
            .background(.black)
    }
}


struct FooterView_Previews: PreviewProvider {
    
    static var previews: some View{
        FooterView()
    }
}
