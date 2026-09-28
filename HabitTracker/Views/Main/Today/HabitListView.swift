import SwiftUI

struct HabitListView: View {
    var viewModel: HabitViewModel
    let habits: [Habit]
    let isCompleted: (Habit) -> Bool
    let currentStreak: (Habit) -> Int
    let onToggle: (Habit) -> Void
    let onDelete: (IndexSet) -> Void
    
    var body: some View {
        List {
            ForEach(habits) { habit in
                NavigationLink {
                    HabitDetailsView(
                        habit: habit,
                        currentStreak: currentStreak(habit),
                        totalCompletions: habit.completionDates.count,
                        viewModel: viewModel          // ← same instance
                    )
                } label: {
                    HabitRowView(
                        habit: habit,
                        isCompleted: isCompleted(habit),
                        currentStreak: currentStreak(habit),
                        onToggle: {
                            onToggle(habit)
                        }
                    )
                }
            }
            .onDelete(perform: onDelete)
        }
        .listStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        HabitListView(
            viewModel: HabitViewModel(),
            habits: [
                Habit(name: "Read 30 minutes", icon: "book", colorTheme: "green", frequency: 1),
                Habit(name: "Exercise", icon: "figure.walk", colorTheme: "blue", frequency: 1)
            ],
            isCompleted: { (habit: Habit) in
                false
            },
            currentStreak: { (habit: Habit) in
                3
            },
            onToggle: { (habit: Habit) in
                print("Toggled \(habit.name)")
            },
            onDelete: { (offsets: IndexSet) in
                print("Delete at \(offsets)")
            }
        )
    }
}
