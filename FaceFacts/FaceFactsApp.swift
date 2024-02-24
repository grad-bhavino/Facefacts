//
//  FaceFactsApp.swift
//  FaceFacts
//
//  Created by Bhavin  Oza on 2/24/24.
//

import SwiftUI
import SwiftData

@main
struct FaceFactsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Person.self)
    }
}
