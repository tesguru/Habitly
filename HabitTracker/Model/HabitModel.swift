import Foundation

struct Habit: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var icon: String
    var colorTheme: String
    var frequency: Int = 1
    var reminder: Date? = nil
    var image: String = ""
    var completionDates: [Date] = []
}
