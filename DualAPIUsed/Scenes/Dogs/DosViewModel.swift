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
    
    private var dogsNetworkManager: DogsNetworkManager = DogsNetworkManager.shared
    
    let columns: [GridItem] = [GridItem(.adaptive(minimum: UIScreen.main.bounds.width * 0.4))]
    
    init() {
        fetchDogs()
    }
    
    func fetchDogs() {
        self.state = .loading
        dogsNetworkManager.fetchDogs { fetchedDogs, error in
                if let error = error {
                    print(error.localizedDescription)
                    self.state = .error
                }
                guard let fetchedDogs = fetchedDogs else {
                    print("## no data found ##")
                    self.state = .error
                    return
                }
                self.dogs = fetchedDogs
                self.state = fetchedDogs.isEmpty ? .empty : .loaded
        }
    }
}
