//
//  SettingsView.swift
//  MockAssignmentOne-PT
//
//  Created by Pubudu Mihiranga on 2024-10-11.
//

import SwiftUI

struct SettingsView: View {
    @Binding var preferredFontSize: Double
    
    var body: some View {
        VStack {
            Text("Font Size: \(String(format: "%.2f", preferredFontSize))")
            Slider(value: $preferredFontSize, in: 12...24)
        }
        .padding()
    }
}

#Preview {
    SettingsView(preferredFontSize: .constant(0))
}
