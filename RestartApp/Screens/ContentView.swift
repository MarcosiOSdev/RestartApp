//
//  ContentView.swift
//  RestartApp
//
//  Created by marcos.felipe.souza on 30/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding")
    var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
