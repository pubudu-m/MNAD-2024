//
//  ProfileView.swift
//  TabViewDemo
//
//  Created by Pubudu Mihiranga on 2024-10-09.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Text("ProfileView")
            .onAppear {
                print("onAppear")
            }
            .onDisappear {
                print("onDisappear")
            }
    }
}

#Preview {
    ProfileView()
}
