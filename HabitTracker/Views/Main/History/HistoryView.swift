import SwiftUI

struct HistoryView: View {
    var viewModel:HabitViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.allHabits.isEmpty {
                    ContentUnavailableView(
                        "No History Yet",
                        systemImage: "calendar",
                        description: Text("Add a habit and start tracking your progress!")
                    )
                } else {
                    List {
                        ForEach(viewModel.allHabits) { habit in
                            Section(habit.name) {
                                if habit.completionDates.isEmpty {
                                    Text("No completions yet")
                                        .foregroundColor(.secondary)
                                } else {
                                    ForEach(habit.completionDates.sorted(by: >), id: \.self) { date in
                                        Text(date.formatted(date: .abbreviated, time: .omitted))
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("History")
        }
    }
}

#Preview {
    HistoryView(viewModel: HabitViewModel())
}
