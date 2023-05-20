//
//  MainDetailView.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-18.
//

import SwiftUI

struct MainDetailView: View {
    
    var user: User
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.green)
                .ignoresSafeArea()
                .opacity(0.4)
            VStack {
                AsyncImage(url: user.largePictureURL) { image in
                    image
                        .resizable()
                        .frame(width: .largeScreenWidth, height: .largeScreenWidth)
                        .padding()
                        .cornerRadius(.cornerRadius)
                        .background(
                            Color.white
                                .cornerRadius(.cornerRadius)
                        )
                } placeholder: {
                    Image(systemName: "question")
                        .resizable()
                        .frame(width: .largeScreenWidth, height: .largeScreenWidth)
                        .padding()
                        .cornerRadius(.cornerRadius)
                        .background(
                            Color.white
                                .cornerRadius(.cornerRadius)
                            )
                }
                Text(user.fullName)
                    .font(.skFont(type: .largeBold))
                    .padding()
                Text(user.gender)
                    .font(.skFont(type: .normalBold))
                    .padding()
                Text(user.email)
                    .font(.skFont(type: .tinyBold))
                Text(user.phone)
                    .font(.skFont(type: .normal))
                    .padding(.bottom, 5)
                
                Text("\(user.location.city)\t\(user.location.state)")
                    .font(.skFont(type: .smallBold))
                Text(user.location.country)
                    .font(.skFont(type: .normalBold))
            }
        }
    }
}

struct MainDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainDetailView(user: User.mockUser)
    }
}
