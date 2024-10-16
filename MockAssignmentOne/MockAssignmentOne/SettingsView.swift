//
//  SettingsView.swift
//  MockAssignmentOne
//
//  Created by Pubudu Mihiranga on 2024-10-09.
//

import SwiftUI

enum AppTheme: String, CaseIterable {
    case red = "Red"
    case orange = "Orange"
    case green = "Green"
}

struct SettingsView: View {
    @Binding var preferredFontSize: Double
    @Binding var preferredSystemColor: String

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Font size (\(preferredFontSize, specifier: "%.2f")px)")
                Slider(value: $preferredFontSize, in: 16...24)
                
                HStack {
                    Text("System color")
                    
                    Picker("", selection: $preferredSystemColor) {
                        ForEach(AppTheme.allCases, id: \.self) { theme in
                            Text(theme.rawValue).tag(theme.rawValue)
                        }
                    }
                    .pickerStyle(.wheel)
                    
                    Color(preferredSystemColor)
                        .frame(width: 30, height: 30)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(preferredFontSize: .constant(16), preferredSystemColor: .constant("Green"))
}
