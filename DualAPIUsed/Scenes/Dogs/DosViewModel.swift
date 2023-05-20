//
//  DosViewModel.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-13.
//

import SwiftUI

class DogsViewModel: ObservableObject {
    
    @Published var dogs: [Dog] = []
    @Published var state: ScreenState = .loading
    
    private let dogsNetworkManager: DogsNetworkManager = DogsNetworkManager.shared
    
    let columns: [GridItem] = [GridItem(.adaptive(minimum: UIScreen.main.bounds.width * 0.4))]
    
    init() {
        fetchDogs()
    }
    
    func fetchDogs() {
        self.state = .loading
        dogsNetworkManager.fetchDogs { fetchedDogs, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.state = .error
                    print(error.localizedDescription)
                }
                
                guard let fetchedDogs = fetchedDogs else {
                    self.state = .error
                    print("Not found data.")
                    return
                }
                self.dogs = fetchedDogs
                self.state = fetchedDogs.isEmpty ? .empty : .loaded
            }
        }
    }
}
