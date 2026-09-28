import SwiftUI

struct InsightsView: View {
    var viewModel: HabitViewModel
    
    var body: some View {
        NavigationStack {
            if viewModel.allHabits.isEmpty {
                ContentUnavailableView(
                    "No insights yet",
                    systemImage: "chart.bar",
                    description: Text("Add a habit and start tracking to see your insights.")
                )
            } else {
                List {
                    Section("Summary") {
                        LabeledContent("Total habits", value: "\(viewModel.allHabits.count)")
                        LabeledContent("Total completions", value: "\(totalCompletions)")
                        LabeledContent("Best current streak", value: "🔥 \(bestStreak)")
                        LabeledContent("Completed today", value: "\(completedToday)")
                    }
                }
            }
        }
    }
    
    private var totalCompletions: Int {
        viewModel.allHabits.reduce(0) { sum, habit in
            sum + habit.completionDates.count
        }
    }
    
    private var bestStreak: Int {
        viewModel.allHabits
            .map { habit in viewModel.currentStreak(for: habit) }
            .max() ?? 0
    }
    
    private var completedToday: Int {
        viewModel.allHabits.filter { habit in
            viewModel.isCompleted(habit)
        }.count
    }
}

#Preview {
    InsightsView(viewModel: HabitViewModel())
}
