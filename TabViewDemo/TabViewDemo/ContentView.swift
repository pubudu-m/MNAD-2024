//
//  ContentView.swift
//  TabViewDemo
//
//  Created by Pubudu Mihiranga on 2024-10-09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
}
