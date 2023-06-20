//
//  SettingView.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-12.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack {
            Image(systemName: "gear")
                .resizable()
                .scaledToFit()
                .frame(width: .largeScreenWidth, height: .largeScreenWidth)
                .foregroundColor(.orange)
                .opacity(0.6)
                .padding()
            
            Text("Settings")
                .font(.skFont(type: .hugeBold))
                .foregroundColor(.orange)
                .opacity(0.6)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
