import SwiftUI
import Foundation


struct RootView: View{
    var viewModel: HabitViewModel
    @AppStorage("hasCompletedOnboarding")
    private var hasCompletedOnboarding: Bool = false
    var body: some View {
        if hasCompletedOnboarding{
            ContentView(viewModel: viewModel)
        }
        else{
            OnboardingView()
        }
    }
}
