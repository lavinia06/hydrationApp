//
//  TabBarItemView.swift
//  HydrationApp
//
//  Created by Ionel, Lavinia on 02.08.2024.
//

import SwiftUI


struct TabBarItemView: View {
    var title: String
    var selectedImage: String
    var unselectedImage: String
    var isSelected: Bool
    
    
    var body: some View {
        VStack(spacing: 0) {
            Image(isSelected ? selectedImage : unselectedImage)
                .font(.system(size: 24))
            Text(title)
                .font(.system(size: 14))
        }
    }
}

