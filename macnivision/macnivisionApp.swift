//
//  macnivisionApp.swift
//  macnivision
//
//  Created by renaka agusta on 24/06/22.
//

import SwiftUI

@main
struct macnivisionApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
