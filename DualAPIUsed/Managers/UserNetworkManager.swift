//
//  UserNetworkManager.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-11.
//


import SwiftUI

final class UserNetworkManager {
    static var shared = UserNetworkManager()
    
    func fetchUsers(completion: @escaping ([User]?, Error?) -> Void) {
        let urlString: String = "https://randomuser.me/api/?results=20"
        guard let url: URL = URL(string: urlString) else { return }
        let urlRequest: URLRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(UserResult.self, from: data)
                completion(decodedData.results, nil)
            } catch {
                completion(nil, error)
            }
        }
        .resume()
    }
}
