//
//  CatsView.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-12.
//

import SwiftUI

struct CatsView: View {
    
    @StateObject var viewModel: CatsViewModel = CatsViewModel()
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .loaded:
                catsVGridCard
            case .empty:
                EmptyView {
                    viewModel.fetchCats()
                }
            case .error:
                EmptyView {
                    viewModel.fetchCats()
                }
            }
        }
        
            .navigationTitle("Cats")
            .navigationBarTitleDisplayMode(.inline)
    }
    
    private var catsVGridCard: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.columns) {
                ForEach(viewModel.cats) { cat in
                    AsyncImage(url: cat.catPicture) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .cornerRadius(.cornerRadius)
                            .padding()
                            .background(
                                Color.orange
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

struct CatsView_Previews: PreviewProvider {
    static var previews: some View {
        CatsView()
    }
}
