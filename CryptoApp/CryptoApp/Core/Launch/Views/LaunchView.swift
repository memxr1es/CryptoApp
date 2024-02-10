//
//  LaunchView.swift
//  CryptoApp
//
//  Created by Никита Котов on 24.09.2023.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var loadingTexts = [
        "Loading your portfolio...".map{String($0)},
        "Loading prices...".map{String($0)},
        "Loading coins...".map{String($0)},
        "Loading price increases...".map{String($0)},
        "Loading good day...".map{String($0)},
        "Loading a good mood...".map{String($0)}
    ]
    @State private var showLoadingText: Bool = false
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @Binding var showLaunchView: Bool
    
    let randomizeText = Int.random(in: 0..<5)
    
    var body: some View {
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
            
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
            
            ZStack {
                if showLoadingText {
                    
                    HStack(spacing: 0) {
                        ForEach(loadingTexts[randomizeText].indices, id: \.self) { index in
                            Text(loadingTexts[randomizeText][index])
                                .font(.headline)
                                .foregroundStyle(Color.launch.accent)
                                .fontWeight(.heavy)
                                .offset(y: counter == index ? -5 : 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn(duration: 0.5)))
                }
            }
            .offset(y: 70)
            .onAppear{ showLoadingText.toggle() }
            .onReceive(timer, perform: { _ in
                withAnimation(.spring) {
                    let lastIndex = loadingTexts[randomizeText].count - 1
                    if counter == lastIndex {
                        counter = 0
                        loops += 1
                        
                        if loops >= 2 {
                            showLaunchView = false
                        }
                        
                    } else {
                        counter += 1
                    }
                }
            })
        }
    }
}

#Preview {
    LaunchView(showLaunchView: .constant(true))
}
