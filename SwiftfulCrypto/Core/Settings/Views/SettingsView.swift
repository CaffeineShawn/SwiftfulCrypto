//
//  SettingsVIew.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com")!
    let githubURL = URL(string: "https://github.com/CaffeineShawn")!
    let swiftfulThinkingURL = URL(string: "https://www.youtube.com/c/swiftfulthinking")!
    let coingeckoURL = URL(string: "https://www.coingecko.com/en")!
    var body: some View {
        NavigationView {
            ZStack {
                
                Color.theme.background
                    .ignoresSafeArea()
                
                List {
                    mySection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    swiftfulThinkingSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    coingeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    applicationSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    
                }
                
                
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton(presentationMode: _presentationMode)
                }
        })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
extension SettingsView {
    private var swiftfulThinkingSection: some View {
        Section(header: Text("Swiftful thinking")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made by following a @SwiftfulThinking course on Youtube. It uses MVVM architecture, Combine, and Core Data")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit Swiftful Thinking", destination: swiftfulThinkingURL)
        }
        .padding()
    }
    
    private var coingeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko ", destination: coingeckoURL)
        }
    }
    
    private var mySection: some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading) {
                Image("my")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Have fun learning in Swift. This program is wrote 100% in Swift. Benefits from multi-threading, publishers/subscribers, and data persistance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit GitHub @Caffeine Shawn ", destination: githubURL)
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Application")) {
            Link("Terms of Service",destination: defaultURL)
            Link("Privacy Policy",destination: defaultURL)
            Link("Learn more",destination: defaultURL)
        }
    }
}
