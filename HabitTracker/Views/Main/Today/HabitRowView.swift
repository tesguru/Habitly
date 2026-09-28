import SwiftUI

struct HabitRowView: View {
    let habit: Habit
    let isCompleted: Bool
    let currentStreak: Int
    let onToggle: () -> Void
  
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: habit.icon)
                .font(.system(size: 20))
                .foregroundColor(.green)
                .frame(width: 40, height: 40)
                .background(Color.green.opacity(0.15))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                           Text(habit.name)
                               .font(.body)
                               .fontWeight(.medium)
                               .strikethrough(isCompleted, color: .secondary)
                           
                           if currentStreak > 0 {
                               Text("🔥 \(currentStreak)")
                                   .font(.caption)
                                   .foregroundColor(.secondary)
                           }
                       }
            
            Spacer()
            
            Button {
                onToggle()
            } label: {
                Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 24))
                    .foregroundColor(isCompleted ? .green : .gray.opacity(0.4))
            }
            .buttonStyle(.plain)
            }
            .padding(.vertical, 9)
    }
}

#Preview {
    HabitRowView(
        habit: Habit(name: "Read 30 minutes", icon: "star", colorTheme: "green", frequency: 1),
        isCompleted: false,
        currentStreak: 0,
        onToggle: {}
    )
}
