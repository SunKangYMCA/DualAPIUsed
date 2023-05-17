//
//  SplashViewModel.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-12.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var shouldShowTabView: Bool = false
    
    func showTabView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                self.shouldShowTabView = true
            }
        }
    }
}
