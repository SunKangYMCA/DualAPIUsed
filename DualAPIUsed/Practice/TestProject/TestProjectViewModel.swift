//
//  TestProjectViewModel.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-26.
//

import SwiftUI

final class TestProjectViewModel: ObservableObject {
    
    @Published var users: [TestUser] = []
    
    func fetchUsers() {
        let usersUrlString = "https://jsonplaceholder.typicode.com/users"
        if let url = URL(string: usersUrlString) {
            
            URLSession
                .shared
                .dataTask(with: url) { [weak self] data, response, error in
                    if let error = error {
                        print(error)
                    } else {
                        
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        if let data = data,
                           let users = try? decoder.decode([TestUser].self, from: data) {
                            
                            self?.users = users
                            
                        } else {
                            
                        }
                    }
                }
                .resume()
        }
    }
}
