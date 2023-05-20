//
//  CatsViewModel.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-15.
//

import SwiftUI

class CatsViewModel: ObservableObject {
    
    @Published var cats: [Cat] = []
    @Published var state: ScreenState = .loading
    
    private var catsNetworkManager: CatsNetworkManager = CatsNetworkManager.shared
    
    let columns: [GridItem] = [GridItem(.adaptive(minimum: UIScreen.main.bounds.width * 0.4))]
    
    init() {
        fetchCats()
    }
    
    func fetchCats() {
        state = .loading
        catsNetworkManager.fetchCats { fetchedCats, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.state = .error
                    print(error.localizedDescription)
                }
                guard let fetchedCats = fetchedCats else {
                    self.state = .error
                    return
                }
                self.cats = fetchedCats
                self.state = fetchedCats.isEmpty ? .empty : .loaded
            }
        }
    }
}
