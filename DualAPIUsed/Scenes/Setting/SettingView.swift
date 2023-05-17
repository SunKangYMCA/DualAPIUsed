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
                .frame(width: 200, height: 200)
                .foregroundColor(.orange)
                .opacity(0.6)
        
            Text("Settings")
                .font(.skFont(type: .largeBold))
                .foregroundColor(.orange)
                .opacity(0.6)
                .padding()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
