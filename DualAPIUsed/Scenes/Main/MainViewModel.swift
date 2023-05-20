//
//  MainViewModel.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-11.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var state: ScreenState = .loading
    @Published var currentPage: Int = 0
    
    private let userNetworkManager: UserNetworkManager = UserNetworkManager.shared
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers(pageIndex: Int = 0) {
        userNetworkManager.fetchUsers(pageIndex: pageIndex) { fetchedUsers, error in
                    DispatchQueue.main.async {
                    if let error = error {
                        print(error.localizedDescription)
                        self.state = .error
                    }
                    
                    guard let fetchedUsers = fetchedUsers else {
                        print("Not found.")
                        self.state = .error
                        return
                    }
                        self.users.append(contentsOf: fetchedUsers)
                    self.state = fetchedUsers.isEmpty ? .empty : .loaded
                }
            }
        }
    }

