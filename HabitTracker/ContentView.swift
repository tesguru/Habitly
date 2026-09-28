

import SwiftUI

struct ContentView: View {
    var viewModel: HabitViewModel
    
    var body: some View {
        MainTabView(viewModel: viewModel)
    }
}

#Preview {
    ContentView(viewModel:  HabitViewModel())
}
