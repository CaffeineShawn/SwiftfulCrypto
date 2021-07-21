//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/20.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    @StateObject private var vm = HomeViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
                .environmentObject(vm)
        }
    }
}
