//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Olaogun Teslim on 04/09/2026.
//

import SwiftUI

@main
struct HabitTrackerApp: App {
    @State private var viewModel = HabitViewModel()
    var body: some Scene {
        WindowGroup {
            RootView(viewModel: viewModel)
        }
    }
}
