//
//  MainTabView.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-12.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        
        TabView {
            NavigationView {
                MainView()
            }
            .tabItem {
                Label("Customer", systemImage: "house")
            }
            .badge(20)
            
            NavigationView {
                DogsView()
            }
            .tabItem {
                Label("Dogs", systemImage: "d.circle")
            }
            .badge(15)
            
            NavigationView {
                CatsView()
            }
            .tabItem {
                Label("Cats", systemImage: "c.circle")
            }
            .badge("New")
            
            NavigationView {
                SettingView()
            }
            .tabItem {
                Label("Settings", systemImage: "gear.circle")
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

