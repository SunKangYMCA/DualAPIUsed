//
//  SplashView.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-12.
//

import SwiftUI

struct SplashView: View {
    
    @StateObject var viewModel: SplashViewModel = SplashViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.shouldShowTabView {
                MainTabView()
            } else {
                Rectangle()
                    .ignoresSafeArea()
                VStack {
                    Image("Customer")
                        .resizable()
                        .scaledToFit()
                    Text("Customer")
                        .foregroundColor(.white)
                        .font(.skFont(type: .hugeBold))
                        .padding()
                }
                
            }
        }
        .onAppear {
                viewModel.showTabView()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
