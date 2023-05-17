//
//  MainView.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-11.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .loaded:
                MainListRow
            case .empty:
                EmptyView {
                    viewModel.fetchUsers()
                }
            case .error:
                EmptyView {
                    viewModel.fetchUsers()
                }
            }
        }
        .navigationTitle("Customer")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var MainListRow: some View {
        List {
            ForEach(viewModel.users) { user in
                HStack {
                    AsyncImage(url: user.thumbnailPictureURL
                    ) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                    } placeholder: {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48, height: 48)
                    }
                    VStack {
                        HStack {
                            Text(user.fullName)
                                .font(.skFont(type: .smallBold))
                            Spacer()
                        }
                        
                        HStack {
                            Text(user.email)
                                .font(.skFont(type: .small))
                                .foregroundColor(.gray)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
