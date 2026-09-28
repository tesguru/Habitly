
import SwiftUI

struct MainTabView: View {
    var viewModel: HabitViewModel
    
    var body: some View {
        TabView {
            TodayView(viewModel: viewModel)
                .tabItem { Label("Today", systemImage: "checkmark.circle.fill") }
            
            HistoryView(viewModel: viewModel)
                .tabItem { Label("History", systemImage: "calendar") }
            
            InsightsView(viewModel: viewModel)
                .tabItem { Label("Insights", systemImage: "chart.bar") }
            
            ProfileView(viewModel: viewModel)
                .tabItem { Label("Profile", systemImage: "person") }
        }
        .tint(.green)
    }
}

#Preview {
    MainTabView(viewModel: HabitViewModel())
}
