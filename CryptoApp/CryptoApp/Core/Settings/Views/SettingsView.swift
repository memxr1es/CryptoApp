//
//  SettingsView.swift
//  CryptoApp
//
//  Created by Никита Котов on 24.09.2023.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com/c/swiftfulthinking")!
    let telegramURL = URL(string: "https://t.me/memx_bus")!
    let channelURL = URL(string: "https://t.me/plchaldrr")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://github.com/memxr1es")!
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.theme.background
                    .ignoresSafeArea()
                
                List {
                    swiftfulThinkingSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    coinGeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    developerSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    applicationSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                     XMarkButton()
                }
            }
            .listStyle(.grouped)
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    private var swiftfulThinkingSection: some View {
        Section(header: Text("Swiftufl Thinking")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This app was made by following @Swiftful Thinking course on YouTube. It uses MVVM Architecture, Combine and CoreData!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link(destination: youtubeURL) {
                HStack {
                    Image(systemName: "link")
                    Text("Subscribe on YouTube! 🥳")
                }
            }
            .bold()
        }
    }
    
    private var coinGeckoSection: some View {
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
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link(destination: coingeckoURL) {
                HStack {
                    Image(systemName: "link")
                    Text("Visit CoinGecko! 😋")
                }
            }
            .bold()
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading) {
                Image("dev-logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This app was developed by Nikita Kotov. It uses SwiftUI and is written 100% in Swift. The project benefits from multi-threading, publishers / subscribers, and data persistance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link(destination: personalURL) {
                HStack {
                    Image(systemName: "link")
                    Text("Visit Website! 🤭")
                }
            }
            .bold()
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Application")) {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Contact", destination: telegramURL)
            Link("Learn More", destination: defaultURL)
        }
    }
}
