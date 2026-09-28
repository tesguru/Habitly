

import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel();
    var body: some View {
       
        VStack{
            HStack{
                Spacer()
                if !viewModel.isLastPage {
                    Button("Skip") {
                        viewModel.skipToLastPage()
                    }
                    .padding(.trailing, 20)
                }           }
         Spacer()
            Image("screen").resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding(.bottom, 30)
            
            
            VStack(spacing: 10) {
                Text(viewModel.pages[viewModel.currentPage].title)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                
                Text(viewModel.pages[viewModel.currentPage].description)
                    .font(.body)
            }
            Button {
                viewModel.goToNextPage()
            } label: {
                HStack(spacing: 10) {
                    Text(viewModel.buttonText)
                        .fontWeight(.semibold)

                    Image(systemName: "arrow.right")
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 49)
            }
            .background(.green)
            .clipShape(Capsule())
            .frame(maxWidth: 300)
            .padding(.horizontal, 22)
            
            HStack(spacing:4){
                Text("Already have an account?")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                Button("Sign in"){
                    print("Sign in tapped")
                }
                .foregroundColor(Color.green)
                .font(.subheadline)
                .fontWeight(.semibold)
                
            }.padding(.top, 12)
            
            HStack(spacing: 8) {
                ForEach(viewModel.pages.indices, id: \.self ){ index in
                    if viewModel.currentPage == index{
                        Capsule()
                        .fill(Color.green)
                    .frame(width: 20, height: 4)
                    }
                    else{
                        Circle()
                                       .fill(Color.gray.opacity(0.3))
                                       .frame(width: 8, height: 8)
                    }
                    
                }
            }
         
           
            Spacer()
          
                
           
        }
    }
}

#Preview {
    OnboardingView()
}
