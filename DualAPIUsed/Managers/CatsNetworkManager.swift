//
//  CatsNetworkManager.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-15.
//

import SwiftUI

final class CatsNetworkManager {
    static var shared = CatsNetworkManager()
    
    func fetchCats(completion: @escaping ([Cat]?, Error?) -> Void) {
        var request = URLRequest(url: URL(string: "https://api.thecatapi.com/v1/images/search?format=json&limit=10")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("DEMO-API-KEY", forHTTPHeaderField: "x-api-key")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(nil, error)
                print(error.localizedDescription)
            }
            
            guard let data = data else {
                completion(nil, error)
                print("Not found.")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Cat].self, from: data)
                completion(decodedData, nil)
            } catch {
                completion(nil, error)
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
