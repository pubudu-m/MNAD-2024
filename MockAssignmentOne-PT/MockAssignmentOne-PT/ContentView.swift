//
//  ContentView.swift
//  MockAssignmentOne-PT
//
//  Created by Pubudu Mihiranga on 2024-10-11.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("preferredFontSize") var preferredFontSize: Double = 12
    @State var preferredSystemColor: AppThemeColor = .blue
    
    var body: some View {
        TabView {
            GameView(preferredFontSize: $preferredFontSize,
                     preferredSystemColor: $preferredSystemColor)
                .tabItem {
                    Label("Guess", systemImage: "house")
                }
            
            SettingsView(preferredFontSize: $preferredFontSize,
                         preferredSystemColor: $preferredSystemColor)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
}
