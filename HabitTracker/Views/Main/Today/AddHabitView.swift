import SwiftUI

struct AddHabitView: View {
    var viewModel: HabitViewModel
    var habitToEdit: Habit? = nil
    @Environment(\.dismiss) private var dismiss
    @State private var habitName = ""
    
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Habit Name", text: $habitName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            .navigationTitle(habitToEdit == nil ? "New Habit" : "Edit Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveHabit()
                    }
                    .disabled(habitName.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
        .onAppear{
            if let habitToEdit{
                habitName = habitToEdit.name
            }
        }
    }
    
    private func saveHabit() {
        let trimmedName = habitName.trimmingCharacters(in: .whitespaces)
        
        if let habitToEdit{
            var updated = habitToEdit
            updated.name = trimmedName
            viewModel.editHabit(updated)
        }
        else{
            let newHabit = Habit(
                name: habitName.trimmingCharacters(in: .whitespaces),
                icon: "star",
                colorTheme: "green",
                frequency: 6
            )
            viewModel.addHabit(habit: newHabit)
        }
        dismiss()
    }
}


#Preview {
    AddHabitView(viewModel: HabitViewModel())
}
