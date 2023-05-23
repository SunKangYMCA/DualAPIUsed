//
//  MainView.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-11.
//

import SwiftUI

struct MainView: View {
    
    @State private var searchText: String = ""
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
                    viewModel.fetchUsers(isRefresh: true)
                }
            case .error:
                EmptyView {
                    viewModel.fetchUsers(isRefresh: true)
                }
            }
        }
        .navigationTitle("Customer")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var MainListRow: some View {
        List {
            ForEach(filterUsers) { user in
                NavigationLink {
                    MainDetailView(user: user)
                } label: {
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
                .searchable(text: $searchText, prompt: "Who are you looking for")
                .onAppear {
                    if viewModel.users.last == user {
                        print("##test showing last user")
                        print("##test fetch nextpage")
                        viewModel.fetchUsers()
                    }
                }
            }
        }
    }
    
    private var filterUsers: [User] {
        if searchText.isEmpty {
            return viewModel.users
        } else {
            return viewModel.users.filter { $0.fullName.contains(searchText)
            }
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
