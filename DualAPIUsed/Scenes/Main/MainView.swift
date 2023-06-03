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
                mainListRow
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
    
    private var mainListRow: some View {
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
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                        } placeholder: {
                            Image(systemName: "person")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
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
                .onAppear {
                    if viewModel.users.last == user {
                        print("Test Showing Last User")
                        print("Test Fetch NextPage")
                        viewModel.fetchUsers()
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "Who are you looking for")
    }
    
    private var filterUsers: [User] {
        if searchText.isEmpty {
            return viewModel.users
        } else {
            return viewModel.users.filter {
                $0.fullName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
