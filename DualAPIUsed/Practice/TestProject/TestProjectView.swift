//
//  TestProjectView.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-26.
//

import SwiftUI

struct TestProjectView: View {
    
    @StateObject var viewModel: TestProjectViewModel = TestProjectViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.users, id: \.id) { user in
                    VStack(alignment: .leading) {
                        Text("**Name**: \(user.name)")
                        Text("**Email**: \(user.email)")
                        Divider()
                        Text("**Company**: \(user.company.name)")
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .padding(.horizontal, 4)
                }
                        .listRowSeparator(.hidden)
                }
            }
        }
    }

struct TestProjectView_Previews: PreviewProvider {
    static var previews: some View {
        TestProjectView()
    }
}
