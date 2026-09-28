import Foundation
import SwiftUI


@Observable
class HabitViewModel{
    var allHabits: [Habit] = []
    private let saveKey = "save_habits";
    init (){
        loadHabits()
    }
    func addHabit(habit: Habit){
        allHabits.append(habit)
        saveHabits()
    }
    func editHabit(_ updatedHabit: Habit){
        if let index = allHabits.firstIndex(where: {$0.id == updatedHabit.id}){
            allHabits[index] = updatedHabit
            saveHabits()
        }
    }

    func deleteHabit(at offset: IndexSet) {
        allHabits.remove(atOffsets: offset)
        saveHabits()
    }

    func getHabit() -> [Habit]{
            return allHabits
        saveHabits()
        
    }
    
    private func saveHabits(){
        if let encoded = try? JSONEncoder().encode(allHabits){
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    private func loadHabits(){
        guard let data = UserDefaults.standard.data(forKey: saveKey),
              let decoded = try? JSONDecoder().decode([Habit].self, from: data) else {
            return}
        allHabits = decoded
    }
    
    func toggleCompletion(for habit: Habit, on date: Date = Date()) {
        guard let index = allHabits.firstIndex(where: { $0.id == habit.id }) else {
            return
        }
        
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: date)
        
        if let existingIndex = allHabits[index].completionDates.firstIndex(where: { completionDate in
            calendar.isDate(completionDate, inSameDayAs: startOfDay)
        }) {
            allHabits[index].completionDates.remove(at: existingIndex)
        } else {
            allHabits[index].completionDates.append(startOfDay)
        }
        saveHabits()
    }
    
    func isCompleted(_ habit: Habit, on date: Date = Date()) -> Bool{
        let calendar = Calendar.current
        return habit.completionDates.contains { completionDate in
            calendar.isDate(completionDate, inSameDayAs: date)
        }
    }
    
    func currentStreak(for habit: Habit) -> Int {
        let calendar = Calendar.current
        var streak = 0
        var checkDate  = calendar.startOfDay(for: Date())
        while isCompleted(habit, on: checkDate) {
              streak += 1
            guard let previousDay = calendar.date(byAdding: .day, value: -1, to: checkDate) else{
                break
            }
            checkDate = previousDay
        }
        return streak
        
    }
    
}


