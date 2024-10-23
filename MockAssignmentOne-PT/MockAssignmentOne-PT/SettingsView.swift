//
//  SettingsView.swift
//  MockAssignmentOne-PT
//
//  Created by Pubudu Mihiranga on 2024-10-11.
//

import SwiftUI

enum AppThemeColor: String, CaseIterable {
    case red = "Red"
    case blue = "Blue"
    case green = "Green"
}

struct SettingsView: View {
    @Binding var preferredFontSize: Double
    @Binding var preferredSystemColor: AppThemeColor
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Font Size: \(String(format: "%.2f", preferredFontSize))")
            
            Slider(value: $preferredFontSize, in: 12...24)
            
            HStack {
                Text("System Color")
                
                Picker("", selection: $preferredSystemColor) {
                    ForEach(AppThemeColor.allCases, id: \.self) { theme in
                        Text(theme.rawValue)
                    }
                }
                .pickerStyle(.wheel)
                
                Color(preferredSystemColor.rawValue)
                    .frame(width: 30, height: 30)
            }
        }
        .padding()
    }
}

#Preview {
    SettingsView(preferredFontSize: .constant(0),
                 preferredSystemColor: .constant(.red))
}
