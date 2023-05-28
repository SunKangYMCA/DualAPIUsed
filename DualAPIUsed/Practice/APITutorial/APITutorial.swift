//
//  APITutorial.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-26.
//

import SwiftUI

struct APITutorial: View {
    
    @State private var quotes = [Quote]()
    
    var body: some View {
        NavigationView {
            List(quotes, id: \.quote_id) { quote in
                VStack(alignment: .leading) {
                    Text(quote.author)
                        .font(.headline)
                        .foregroundColor(Color("skyBlue"))
                    Text(quote.quote)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
            } 
            .navigationTitle("Quotes")
            .task {
                await fetchData()
            }
        }
    }
    
    func fetchData() async {
        guard let url = URL(string: "https://www.breakingbadapi.com/api/quotes") else {
            print("hey man THIS URL DOES NOT WORK")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([Quote].self, from: data) {
                quotes = decodedResponse
            }
        } catch {
            print("bad news ... this data isn't valid :(")
        }
    }
}

struct APITutorial_Previews: PreviewProvider {
    static var previews: some View {
        APITutorial()
    }
}
