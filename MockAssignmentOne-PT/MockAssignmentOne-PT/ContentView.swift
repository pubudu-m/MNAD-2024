//
//  ContentView.swift
//  MockAssignmentOne-PT
//
//  Created by Pubudu Mihiranga on 2024-10-11.
//

import SwiftUI

struct ContentView: View {
    @State var preferredFontSize: Double = 12
    
    var body: some View {
        TabView {
            GameView(preferredFontSize: $preferredFontSize)
                .tabItem {
                    Label("Guess", systemImage: "house")
                }
            
            SettingsView(preferredFontSize: $preferredFontSize)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
}
