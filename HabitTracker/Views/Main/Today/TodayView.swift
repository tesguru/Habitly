import SwiftUI

struct TodayView: View {
    var viewModel: HabitViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.allHabits.isEmpty {
                    EmptyStateView(viewModel: viewModel)
                } else {
                    HabitListView(
                        viewModel: viewModel,          
                        habits:
                            viewModel.allHabits,
                        isCompleted: { habit in
                            viewModel.isCompleted(habit)
                        },
                        currentStreak: { habit in
                               viewModel.currentStreak(for: habit)
                           },
                        
                        onToggle: { habit in
                            viewModel.toggleCompletion(for: habit)
                        },
                       
                        onDelete: { offsets in
                               viewModel.deleteHabit(at: offsets)
                           }
                        
                    )
                }
            }
            .navigationTitle("Today")   
        }
    }
}

#Preview {
    TodayView(viewModel: HabitViewModel())
}
