import SwiftUI

struct ProfileView: View {
    var viewModel: HabitViewModel
    @State private var showClearConfirmation = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("About") {
                    LabeledContent("App", value: "Habitly")
                    LabeledContent("Version", value: "1.0")
                }
                
                Section("Data") {
                    Button("Clear all habits", role: .destructive) {
                        showClearConfirmation = true
                    }
                }
            }
            .navigationTitle("Profile")
            .alert("Clear all habits?", isPresented: $showClearConfirmation) {
                Button("Cancel", role: .cancel) { }
                Button("Clear", role: .destructive) {
                    viewModel.allHabits.removeAll()
                    UserDefaults.standard.removeObject(forKey: "save_habits")
                }
            } message: {
                Text("This will delete all your habits permanently. This cannot be undone.")
            }
        }
    }
}

#Preview {
    ProfileView(viewModel: HabitViewModel())
}
