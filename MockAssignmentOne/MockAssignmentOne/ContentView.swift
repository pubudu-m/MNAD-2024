//
//  ContentView.swift
//  MockAssignmentOne
//
//  Created by Pubudu Mihiranga on 2024-10-09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GameView()
                .tabItem {
                    Label("Guess", systemImage: "house")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear.circle.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
