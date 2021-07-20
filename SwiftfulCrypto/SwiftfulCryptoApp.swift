//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/20.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
