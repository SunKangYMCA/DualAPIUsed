//
//  LoadingView.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-13.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("Loading...")
                .font(.skFont(type: .smallBold))
                .foregroundColor(.white)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle()
                )
        }
        .padding()
        .background(
            Color.gray
                .cornerRadius(.cornerRadius)
                .opacity(0.5)
        )
    }
}
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
