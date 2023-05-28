//
//  UserNetworkManager.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-11.
//


import SwiftUI

final class UserNetworkManager {
    static var shared = UserNetworkManager()
    
    func fetchUsers(
        pageIndex: Int = 0,
        completion: @escaping ([User]?, Error?) -> Void
    ) {
        let urlString: String =
        "https://randomuser.me/api/?results=20&page=\(pageIndex)&seed=abc"
        guard let url: URL = URL(string: urlString) else { return }
        let urlRequest: URLRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(nil, error)
                print(error.localizedDescription)
            }
            
            guard let data = data else {
                completion(nil, error)
                print("not found.")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(Result.self, from: data)
                completion(decodedData.results, nil)
            } catch {
                completion(nil, error)
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
