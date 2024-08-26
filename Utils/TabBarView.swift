import SwiftUI

struct TabBarView: View {
    @ObservedObject var unitManager = UnitManager.shared
    @StateObject private var daily_vm = DailyGoalVM(model: DailyGoalModel(dailyGoal: 2000, selectedUnit: .ml))
    @StateObject private var container_vm = ContainerViewModel(model: ContainerModel(capacity1:200, capacity2: 300, capacity3: 400))
    @StateObject private var home_vm = HomeViewModel(dailyGoalModel: DailyGoalModel(dailyGoal: 2000, selectedUnit: .ml))
    @State private var selectedIndex = 0
    
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $selectedIndex) {
                    HomeView(home_vm: home_vm, viewModel: daily_vm, containerVM: container_vm)
                        .tabItem {
                            TabBarItemView(title: "Today", selectedImage: "Today_green", unselectedImage: "Today_un", isSelected: selectedIndex == 0)
                        }
                        .tag(0)
                    HistoryView()
                        .tabItem {
                            TabBarItemView(title: "History", selectedImage: "History_green", unselectedImage: "History_un", isSelected: selectedIndex == 1)
                        }
                        .tag(1)
                }
                .onAppear {
                    let appearance = UITabBarAppearance()
                    appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
                    appearance.backgroundColor = UIColor.black
                    appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color(hex: "40F589"))]
                    
                    UITabBar.appearance().standardAppearance = appearance
                    if #available(iOS 15.0, *) {
                        UITabBar.appearance().scrollEdgeAppearance = appearance
                    }
                }
            }
        }
    }
}

struct HomeFooterView_Preview: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .previewLayout(.sizeThatFits)
    }
}

