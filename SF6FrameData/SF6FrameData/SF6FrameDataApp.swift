//
//  SF6FrameDataApp.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 01/07/23.
//

import SwiftUI

@main
struct SF6FrameDataApp: App {
    @StateObject private var store = TipStore()

    var body: some Scene {
        WindowGroup {
            CharactersView()
                .environmentObject(store)
        }
    }
}
