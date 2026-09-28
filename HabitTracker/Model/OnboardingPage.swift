

import Foundation

struct OnboardingPage: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
    
    static let pages : [OnboardingPage] = [
         
        OnboardingPage(
                   title: "Build Better Habits",
                   description: "Create habits that actually stick.",
                   imageName: "person.fill.checkmark"
               ),
               OnboardingPage(
                   title: "Create Habits You Want",
                   description: "Choose from suggestions.",
                   imageName: "list.bullet.clipboard"
               ),
               OnboardingPage(
                   title: "Track Your Progress",
                   description: "Monitor your streaks.",
                   imageName: "chart.line.uptrend.xyaxis"
               )
        ]
}
