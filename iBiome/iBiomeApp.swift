//
//  iBiomeApp.swift
//  iBiome
//
//  Created by MUNAVAR PM on 22/09/23.
//

import SwiftUI

@main
struct iBiomeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
