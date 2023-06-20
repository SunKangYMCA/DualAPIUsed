//
//  DogsNetworkManager.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-13.
//

import SwiftUI

final class DogsNetworkManager {
    static var shared = DogsNetworkManager()
    
    func fetchDogs(completion: @escaping ([Dog]?, Error?) -> Void) {
        var request = URLRequest(url: URL(string: "https://api.thedogapi.com/v1/images/search?format=json&limit=10")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("live_26dwRKpdq5JxalaOLvR2PlCCQlPM9pgj3zddARSiTXZ0T9Zgffp6aWey3OiPXvHY", forHTTPHeaderField: "x-api-key")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(nil, error)
            }
            
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Dog].self, from: data)
                completion(decodedData, nil)
            } catch {
                completion(nil, error)
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
