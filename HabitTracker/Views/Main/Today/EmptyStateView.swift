

import SwiftUI

struct EmptyStateView: View {
    var viewModel: HabitViewModel
    @State private var showAddHabit = false
    var body: some View {
        VStack(spacing:24){
            
//            Spacer()
          
            Image(systemName: "tray")
                .font(.system(size: 80))
                .foregroundColor(.gray.opacity(0.4))
            VStack(spacing: 8){
                Text("No habits Yet")
                    .font(.title2)
                    .bold()
                
                Text("Tap + to create your first habit and start your journey.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
            
            Button{
                showAddHabit = true
            } label:{
            Image(systemName: "plus")
            .font(.system(size: 24, weight: .semibold))
            .foregroundColor(.white)
            .frame(width: 64, height: 64)
            .background(Color.green)
             .clipShape(Circle())
            }
//          Spacer()
        }   .sheet(isPresented: $showAddHabit) {
            AddHabitView(viewModel: viewModel)
        }
     
    }
}


//   #Preview {
//EmptyStateView(viewModel: HabitViewModel())
//}


