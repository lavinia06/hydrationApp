//
//  HomeView.swift
//  HydrationApp
//
//  Created by Ionel, Lavinia on 02.08.2024.



import SwiftUI

struct HomeView: View {
    @ObservedObject var home_vm: HomeViewModel
    @ObservedObject var viewModel: DailyGoalVM
    @ObservedObject var containerVM: ContainerViewModel
    @ObservedObject var unitManager = UnitManager.shared


    var body: some View {
        NavigationStack {
            ZStack {
                Image("Image")
                    .resizable()
                    .edgesIgnoringSafeArea(.bottom)
                VStack(spacing: 0) {
                    HomeHeaderView(vm: home_vm, dailyVM: viewModel, containerVM: containerVM)
                        .padding(.top, 0)
                        .edgesIgnoringSafeArea(.horizontal)
                    VStack(spacing: 10) {
                        Spacer()
                        let percentage = Double(home_vm.waterIntake) / Double(viewModel.goal) * 100
                        Text("\(Int(percentage))%")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(.green)
                        Text("of \(viewModel.goal) \(unitManager.selectedUnit.rawValue) Goal")
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 20)
                    VStack(spacing: 20) {
                        ZStack {
                            Image("Glass_empty")
                                .resizable()
                                .frame(width: 220, height: 300)
                            TrapezoidalWaterShape(level: home_vm.fillLevel)
                                .fill(Color.white.opacity(0.7))
                                .frame(width: 210, height: 280)
                                .animation(.easeInOut(duration: 1.5), value: home_vm.fillLevel)
                            VStack {
                                Spacer()
                                Text("\(home_vm.waterIntake) \(home_vm.secondWord(of:unitManager.selectedUnit))")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 10)
                            }
                        }
                        HStack(spacing: 10) {
                            ForEach([containerVM.capacity1, containerVM.capacity2, containerVM.capacity3], id: \.self) { amount in
                                Button(action: {
                                    home_vm.addWater(amount: amount)
                                }) {
                                    Text("\(amount) \(home_vm.secondWord(of:unitManager.selectedUnit))")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .padding()
                                        .frame(height: 40)
                                        .frame(minWidth: 120)

                                        .background(Color(hex: "40F589"))
                                        .cornerRadius(3)
                                }
                            }
                        }
                    }
                    .padding(.top, 20)
                    Spacer()
                    Text("Happy you're back to track your healthy \n habit of staying hydrated.")
                        .font(.system(size: 17, weight: .semibold, design: .default))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.bottom, 60)
                }
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}


struct TrapezoidalWaterShape: Shape {
    var level: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let bottomWidth = rect.width * 0.6
        let topWidth = rect.width * 0.95
        
        let maxWaterHeight = rect.height
        let waterHeight = min(maxWaterHeight * level, maxWaterHeight)
        
        let topXOffset = (rect.width - topWidth) / 2
        let bottomXOffset = (rect.width - bottomWidth) / 2
        
        let currentWidth = bottomWidth + (topWidth - bottomWidth) * level
        let currentXOffset = (rect.width - currentWidth) / 2
        
        path.move(to: CGPoint(x: bottomXOffset, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.width - bottomXOffset, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.width - currentXOffset, y: rect.maxY - waterHeight))
        path.addLine(to: CGPoint(x: currentXOffset, y: rect.maxY - waterHeight))
        path.closeSubpath()
        
        return path
    }
}
