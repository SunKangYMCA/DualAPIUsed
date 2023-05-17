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
                .frame(width: 64, height: 64)
            Text("Not found\nPlease try again")
                .font(.skFont(type: .normalBold))
                .multilineTextAlignment(.center)
            
            Button {
                onRetryAction()
            } label: {
                Text("Push")
                    .font(.skFont(type: .normalBold))
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Color.blue
                            .opacity(0.4)
                            .cornerRadius(.cornerRadius)
                    )
            }
            .padding(.top, 32)

        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView(onRetryAction: {})
    }
}
