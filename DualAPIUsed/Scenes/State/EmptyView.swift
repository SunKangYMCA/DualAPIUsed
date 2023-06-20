//
//  EmptyView.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-11.
//

import SwiftUI

struct EmptyView: View {
    
    var onRetryAction: () -> Void
    
    var body: some View {
        VStack {
            Image(systemName: "lasso")
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
            
            Text("Not found\nPlease try agian")
                .font(.skFont(type: .normalBold))
                .foregroundColor(Color("skyBlue"))
                .multilineTextAlignment(.center)
            
            Button {
                onRetryAction()
            } label: {
                Text("Push")
                    .font(.skFont(type: .normalBold))
                    .foregroundColor(.secondary)
                    .padding()
                    .background(
                        Color.blue
                            .cornerRadius(.cornerRadius)
                            .opacity(0.5))
            }
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView(onRetryAction: {})
    }
}
