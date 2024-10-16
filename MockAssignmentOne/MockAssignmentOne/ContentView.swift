//
//  ContentView.swift
//  MockAssignmentOne
//
//  Created by Pubudu Mihiranga on 2024-10-09.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("systemFontSize") var systemFontSize: Double = 16
    @AppStorage("systemColor") var systemColor: String = "Green"
    
    var body: some View {
        TabView {
            GameView(preferredFontSize: $systemFontSize,
                     preferredSystemColor: $systemColor)
                .tabItem {
                    Label("Guess", systemImage: "house")
                }
            
            SettingsView(preferredFontSize: $systemFontSize,
                         preferredSystemColor: $systemColor)
                .tabItem {
                    Label("Settings", systemImage: "gear.circle.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
