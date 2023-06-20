//
//  DogsView.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-12.
//

import SwiftUI

struct DogsView: View {
    
    @StateObject var viewModel: DogsViewModel = DogsViewModel()
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .loaded:
                dogsVGridCard
            case .empty:
                EmptyView {
                    viewModel.fetchDogs()
                }
            case .error:
                EmptyView {
                    viewModel.fetchDogs()
                }
            }
        }
        .navigationTitle("Dogs")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var dogsVGridCard: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.columns) {
                ForEach(viewModel.dogs) { dog in
                    AsyncImage(url: dog.dogPicture) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .cornerRadius(.cornerRadius)
                            .padding()
                            .background(
                                Color.gray
                                    .opacity(0.4)
                                    .cornerRadius(.cornerRadius)
                            )
                    } placeholder: {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .cornerRadius(.cornerRadius)
                        
                    }
                }
            }
        }
    }
}
    struct DogsView_Previews: PreviewProvider {
        static var previews: some View {
            DogsView()
        }
    }
