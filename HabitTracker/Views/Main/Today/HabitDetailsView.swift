

import SwiftUI

struct HabitDetailsView: View {
    let habit: Habit
    let currentStreak: Int
    let totalCompletions: Int
    var viewModel: HabitViewModel
    
    @State private var showEditSheet: Bool = false
    var body: some View {
        List{
            Section("stats"){
                LabeledContent("Current Streak", value: "\(currentStreak)")
                LabeledContent("Total completions", value: "\(totalCompletions)")
            }
            Section("Habit"){
                LabeledContent("Name", value: habit.name)
                LabeledContent("Icon", value: habit.icon)
                LabeledContent("Color theme", value: habit.colorTheme)
            }
        }
        .navigationTitle(habit.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .primaryAction ){
                Button("Edit"){
                    showEditSheet = true
                }
                
            }
        }.sheet(isPresented: $showEditSheet){
           AddHabitView(viewModel: viewModel, habitToEdit: habit)
        }
    }
}
#Preview {
    NavigationStack {
        HabitDetailsView(
          
            habit: Habit(name: "Read 30 minutes", icon: "book", colorTheme: "green", frequency: 1),
            currentStreak: 3,
            totalCompletions: 12,
            viewModel: HabitViewModel(),
        )
    }
}
