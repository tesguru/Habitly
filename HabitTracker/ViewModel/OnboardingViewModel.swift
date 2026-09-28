import SwiftUI
import Combine



class OnboardingViewModel: ObservableObject {
    
    @Published var currentPage: Int = 0
    
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = false
    
    var pages: [OnboardingPage] {
        OnboardingPage.pages
    }
    
    var isLastPage: Bool {
        currentPage == pages.count - 1
    }
    
    var buttonText: String {
        isLastPage ? "Get Started" : "Next"
    }
    
    func goToNextPage() {
        if isLastPage {
            finishOnboarding()
        } else {
            withAnimation {
                currentPage += 1
            }
        }
    }
    
    func skipToLastPage() {  
        withAnimation {
            currentPage = pages.count - 1
        }
    }
    
    func finishOnboarding() {
        withAnimation {
            hasCompletedOnboarding = true
        }
    }
}
